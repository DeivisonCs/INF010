import pandas as pd
from fpdf import FPDF
from mlxtend.frequent_patterns import apriori, association_rules


# Função para criar o DataFrame one-hot encoded a partir de uma lista de transações
def encode_transactions(transactions):
    all_items = sorted(set(item for transaction in transactions for item in transaction))
    encoded_data = []
    for transaction in transactions:
        encoded_data.append({item: (item in transaction) for item in all_items})
    return pd.DataFrame(encoded_data)

# Função para executar o algoritmo Apriori e gerar as regras de associação
def run_analysis(transactions):
    df = encode_transactions(transactions)
    frequent_itemsets = apriori(df, min_support=0.1, use_colnames=True)
    rules = association_rules(frequent_itemsets, metric="confidence", min_threshold=0.5)
    return rules[['antecedents', 'consequents', 'support', 'confidence']]

# Abordagem 1: Transações definidas estaticamente
def static_transactions():
    transactions = [
        ['café', 'pão', 'manteiga'],           # T1
        ['leite', 'cerveja', 'pão', 'manteiga'], # T2
        ['café', 'pão', 'manteiga'],             # T3
        ['leite', 'café', 'pão', 'manteiga'],    # T4
        ['cerveja'],                           # T5
        ['manteiga'],                          # T6
        ['pão'],                               # T7
        ['feijão'],                            # T8
        ['arroz', 'feijão'],                   # T9
        ['arroz']                              # T10
    ]
    return transactions

# Abordagem 2: Leitura das transações a partir de um arquivo CSV
def csv_transactions(csv_file):
    df_csv = pd.read_csv(csv_file)
    # Cada linha deve conter os itens separados por ';'
    transactions = df_csv['items'].apply(lambda x: x.split(';')).tolist()
    return transactions

# Função para gerar um PDF com as duas análises
def generate_pdf(static_rules, csv_rules, output_file):
    pdf = FPDF()
    
    # Página 1: Cabeçalho e análise com dados estáticos
    pdf.add_page()
    pdf.set_font("Arial", "B", 16)
    pdf.cell(0, 10, "Comparação de Regras de Associação", ln=True, align="C")
    pdf.ln(10)
    
    pdf.set_font("Arial", "B", 12)
    pdf.cell(0, 10, "Análise com Dados Estáticos:", ln=True)
    pdf.set_font("Arial", "", 10)
    
    static_text = static_rules.to_string(index=False)
    for line in static_text.split("\n"):
        pdf.cell(0, 5, line, ln=True)
    
    # Página 2: Análise com dados do CSV
    pdf.add_page()
    pdf.set_font("Arial", "B", 12)
    pdf.cell(0, 10, "Análise com Dados do CSV:", ln=True)
    pdf.set_font("Arial", "", 10)
    
    csv_text = csv_rules.to_string(index=False)
    for line in csv_text.split("\n"):
        pdf.cell(0, 5, line, ln=True)
    
    pdf.output(output_file)
    print(f"PDF gerado com sucesso: {output_file}")

if __name__ == "__main__":
    # Configurações para exibir a saída completa sem abreviação (apenas para debug/visualização no terminal)
    pd.set_option('display.max_rows', None)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.max_colwidth', None)
    pd.set_option('display.width', None)
    
    # Análise com dados estáticos
    transactions_static = static_transactions()
    rules_static = run_analysis(transactions_static)
    
    # Análise com dados do CSV
    try:
        transactions_csv = csv_transactions("c:/Users/r1k/Documents/INF010/INF010/MiningAlgorithm/transactions.csv")
        rules_csv = run_analysis(transactions_csv)
    except FileNotFoundError:
        print("Arquivo 'transactions.csv' não encontrado. Certifique-se de que o arquivo existe no diretório de execução.")
        exit(1)
    
    # Gerar PDF com a comparação dos resultados
    generate_pdf(rules_static, rules_csv, "comparacao_regras.pdf")
""