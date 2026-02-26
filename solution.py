import json
import sys

def check_condition(a, operator, b):
    if operator == '>':
        return a > b
    if operator == '<':
        return a < b
    if operator == '=':
        return a == b
    return False

def evaluate_rules(rules, values):
    results = []

    for rule in rules:
        if rule['type'] == 'comparison':
            for i, value in enumerate(values):
                if check_condition(value, rule['check'], rule['value']):
                    results.append((rule['id'], i))

        elif rule['type'] == 'delta':
            over = rule['over']
            for i in range(len(values)):
                if i + over < len(values):
                    delta = values[i + over] - values[i]
                    if check_condition(delta, rule['check'], rule['change']):
                        results.append((rule['id'], i))

    return results

def main():
    config_file = sys.argv[1]
    stream_file = sys.argv[2]

    #reads rules
    with open(config_file) as f:
        rules = json.load(f)

    #reads the stream
    with open(stream_file) as f:
        lines = f.read().splitlines()

    #assigns tower name and values
    tower = lines[0]
    values = [int(x) for x in lines[1:]]

    #evaluates and prints results
    results = evaluate_rules(rules, values)
    results.sort(key=lambda x: (x[0], x[1]))

    for rule_id, index in results:
        print(f"{rule_id}@{index}")

if __name__ == '__main__':
    main()