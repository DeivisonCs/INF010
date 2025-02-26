import pandas as pd
from fpdf import FPDF

# transactions = [
#     ['café', 'pão', 'manteiga'],          
#     ['leite', 'cerveja', 'pão', 'manteiga'], 
#     ['café', 'pão', 'manteiga'],          
#     ['leite', 'café', 'pão', 'manteiga'], 
#     ['cerveja'],                          
#     ['manteiga'],                         
#     ['pão'],                               
#     ['feijão'],                            
#     ['arroz', 'feijão'],                  
#     ['arroz']                             
# ]
        
def get_index_by_product(items, product_name):
    for index, item in enumerate(items):
        if item['product'] == product_name:
            return int(index)
    return -1

def encode_transactions(transactions):
    all_items = sorted(set(item for transaction in transactions for item in transaction))
    
    return all_items

def iterate_items_in_transaction(transaction, items_dict, item):
    for product in transaction:
        if product != item:
            product_index = get_index_by_product(items_dict[item]['items'], product)
            
            if product_index != -1:
                items_dict[item]['items'][get_index_by_product(items_dict[item]['items'], product)]['qtd'] += 1
            else:
                items_dict[item]['items'].append({'product': product, 'qtd': 1})
    
    
def search_in_transactions(transactions, items_dict, item):
    for transaction in transactions:
        # Se tiver o item na transação
        if item in transaction:
            items_dict[item]['qtd'] += 1
            
            # Percorre por cada produto da transação e guarda o nome e incrementa a quantidade de ocorrências desse produto
            iterate_items_in_transaction(transaction, items_dict, item)
            
    
def get_patterns(all_items, transactions):
    items_dict = {}

    # Percorre cada item do dicionário
    for item in all_items:
        items_dict[item] = {'qtd':0, 'items': []}
        
        # Percorre as transações buscando se contem o item
        search_in_transactions(transactions, items_dict, item)
    
    return items_dict
    
def get_support(x, y, transactions):
    both_occurrence = 0
    for transaction in transactions:
        if x in transaction and y in transaction:
            both_occurrence += 1
    return both_occurrence / len(transactions)

def get_confidence(data, x, y, transactions):
    both_occurrence = 0
    x_occurrence = data[x]['qtd']
    for transaction in transactions:
        if x in transaction and y in transaction:
            both_occurrence += 1
    return both_occurrence / x_occurrence if x_occurrence > 0 else 0
    
def format_data(data, transactions):
    output = []
    
    for item in data:
        for product in data[item]['items']:
            sup = get_support(item, product['product'], transactions)
            conf = round(get_confidence(data, item, product['product'], transactions), 2)
            output.append({
                'antecedent': item,
                'consequent': product['product'],
                'support': sup,
                'confidence': conf
            })
    return output

def csv_transactions(csv_file):
    df_csv = pd.read_csv(csv_file)
    # Cada linha deve conter os itens separados por ';'
    transactions = df_csv['items'].apply(lambda x: x.split(';')).tolist()
    return transactions


def generate_pdf(static_data, csv_data, output_file):
    pdf = FPDF()
    
    # Página 1: Dados Estáticos
    pdf.add_page()
    pdf.set_font("Arial", "B", 16)
    pdf.cell(0, 10, "Comparação de Regras de Associação", ln=True, align="C")
    pdf.ln(10)
    
    pdf.set_font("Arial", "B", 12)
    pdf.cell(0, 10, "Dados Estáticos:", ln=True)
    pdf.set_font("Arial", "", 10)
    pdf.cell(0, 10, "Antecedent\tConsequent\tSupport\tConfidence", ln=True)
    for item in static_data:
        line = f"{item['antecedent']}\t{item['consequent']}\t{item['support']:.2f}\t{item['confidence']:.2f}"
        pdf.cell(0, 5, line, ln=True)
    
    # Página 2: Dados do CSV
    pdf.add_page()
    pdf.set_font("Arial", "B", 12)
    pdf.cell(0, 10, "Dados do CSV:", ln=True)
    pdf.set_font("Arial", "", 10)
    pdf.cell(0, 10, "Antecedent\tConsequent\tSupport\tConfidence", ln=True)
    for item in csv_data:
        line = f"{item['antecedent']}\t{item['consequent']}\t{item['support']:.2f}\t{item['confidence']:.2f}"
        pdf.cell(0, 5, line, ln=True)
    
    pdf.output(output_file)
    print(f"PDF gerado: {output_file}")
    
    
def save_to_csv(df, filename):
    df.to_csv(filename, index=False)
    print(f"Arquivo CSV gerado: {filename}")




# ------------------------------------------------------------

if __name__ == "__main__":
    # Configurações para exibir a saída completa sem abreviação (apenas para debug/visualização no terminal)
    pd.set_option('display.max_rows', None)
    pd.set_option('display.max_columns', None)
    pd.set_option('display.max_colwidth', None)
    pd.set_option('display.width', None)
    
    # # Análise com dados estáticos
    # all_items_static = encode_transactions(transactions)
    # data_static = get_patterns(all_items_static, transactions)
    # formatted_static = format_data(data_static, transactions)
    
    # Análise com dados do CSV
    try:
        transactions_csv = csv_transactions("./transactions.csv")
    except FileNotFoundError:
        print("Arquivo 'transactions.csv' não encontrado. Certifique-se de que o arquivo existe no diretório de execução.")
        exit(1)
    
    all_items_csv = encode_transactions(transactions_csv)
    data_csv = get_patterns(all_items_csv, transactions_csv)
    formatted_csv = format_data(data_csv, transactions_csv)
    
    # Gerar PDF comparando os resultados
    # generate_pdf(formatted_static, formatted_csv, "resultado.pdf")
    
    resulta_dataframe = pd.DataFrame(formatted_csv)
    save_to_csv(resulta_dataframe, 'resultado.csv')
    
    # Exibir os resultados no terminal para verificação
    # print("\nResultados Dados Estáticos:")
    # print(formatted_static)
    # print("\nResultados Dados CSV:")
    # print(formatted_csv)