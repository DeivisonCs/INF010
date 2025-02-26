import pandas as pd
from mlxtend.frequent_patterns import apriori, association_rules

# Criando o dataframe com os dados
transactions = [
    ['café', 'pão', 'manteiga'],          # T1
    ['leite', 'cerveja', 'pão', 'manteiga'], # T2
    ['café', 'pão', 'manteiga'],          # T3
    ['leite', 'café', 'pão', 'manteiga'], # T4
    ['cerveja'],                          # T5
    ['manteiga'],                         # T6
    ['pão'],                              # T7 (corrigido)
    ['feijão'],                           # T8 (corrigido)
    ['arroz', 'feijão'],                  # T9
    ['arroz']                             # T10
]


# Criar um DataFrame one-hot encoded
def encode_transactions(transactions):
    all_items = sorted(set(item for transaction in transactions for item in transaction))
    encoded_data = []
    for transaction in transactions:
        encoded_data.append({item: (item in transaction) for item in all_items})
    return pd.DataFrame(encoded_data)

df = encode_transactions(transactions)

# Aplicar o algoritmo Apriori para encontrar os conjuntos frequentes
frequent_itemsets = apriori(df, min_support=0.1, use_colnames=True)

# Gerar as regras associativas
rules = association_rules(frequent_itemsets, metric="confidence", min_threshold=0.5)
pd.set_option('display.max_rows', None)
pd.set_option('display.max_columns', None)

# Exibir as regras encontradas
print(rules[['antecedents', 'consequents', 'support', 'confidence']])