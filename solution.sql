-- This section was used to set up the database
IF DB_ID('SignalSounder') IS NULL
BEGIN
    CREATE DATABASE SignalSounder;
END
GO
USE SignalSounder;
GO

--creating the table
CREATE TABLE dbo.RadioStream (
    StreamId  int IDENTITY(1,1) PRIMARY KEY,
    Tower     varchar(50) NOT NULL,
    RowIndex  int NOT NULL,
    Value     int NOT NULL
);

INSERT INTO dbo.RadioStream (Tower, RowIndex, Value)
VALUES
('tower1', 0, 10), ('tower1', 1, 12), ('tower1', 2, 10),
('tower1', 3, 9),  ('tower1', 4, 1),  ('tower1', 5, 1),
('tower1', 6, 1),  ('tower1', 7, 1),  ('tower1', 8, 8),
('tower1', 9, 2),  ('tower1', 10, 3),
('tower2', 0, 5),  ('tower2', 1, 6),  ('tower2', 2, 20),
('tower2', 3, 25);

CREATE TABLE dbo.SignalRules (
    RuleId    int PRIMARY KEY,
    RuleName  varchar(200) NOT NULL,
    RuleType  varchar(20) NOT NULL,
    [Check]   char(1) NOT NULL,
    Value     int NULL,
    [Change]  int NULL,
    [Over]    int NULL
);

--included specific outlines
INSERT INTO dbo.SignalRules
(RuleId, RuleName, RuleType, [Check], Value, [Change], [Over])
VALUES
(1, 'greater than 10', 'comparison', '>', 10, NULL, NULL),
(2, 'equal to 10', 'comparison', '=', 10, NULL, NULL),
(3, 'less than 10', 'comparison', '<', 10, NULL, NULL),
(4, 'rose more than 5 over 7 numbers', 'delta', '>', NULL, 5, 7),
(5, 'rose exactly 5 over 7 numbers', 'delta', '=', NULL, 5, 7),
(6, 'rose less than 5 over 7 numbers', 'delta', '<', NULL, 5, 7);
GO

--the solution for the query
WITH ComparisonResults AS (
    SELECT r.RuleId, s.RowIndex
    FROM dbo.SignalRules r
    CROSS JOIN dbo.RadioStream s
    WHERE r.RuleType = 'comparison'
    AND (
        (r.[Check] = '>' AND s.Value > r.Value)
        OR (r.[Check] = '<' AND s.Value < r.Value)
        OR (r.[Check] = '=' AND s.Value = r.Value)
    )
),
DeltaResults AS (
    SELECT r.RuleId, s1.RowIndex
    FROM dbo.SignalRules r
    CROSS JOIN dbo.RadioStream s1
    JOIN dbo.RadioStream s2
        ON s1.Tower = s2.Tower
        AND s2.RowIndex = s1.RowIndex + r.[Over]
    WHERE r.RuleType = 'delta'
    AND (
        (r.[Check] = '>' AND (s2.Value - s1.Value) > r.[Change])
        OR (r.[Check] = '<' AND (s2.Value - s1.Value) < r.[Change])
        OR (r.[Check] = '=' AND (s2.Value - s1.Value) = r.[Change])
    )
),
Combined AS (
    SELECT RuleId, RowIndex FROM ComparisonResults
    UNION ALL
    SELECT RuleId, RowIndex FROM DeltaResults
)
SELECT CAST(RuleId AS varchar) + '@' + CAST(RowIndex AS varchar) AS OutputLine
FROM Combined
ORDER BY RuleId, RowIndex;