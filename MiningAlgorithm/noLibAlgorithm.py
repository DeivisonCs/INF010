transactions = [
    ['café', 'pão', 'manteiga'],          
    ['leite', 'cerveja', 'pão', 'manteiga'], 
    ['café', 'pão', 'manteiga'],          
    ['leite', 'café', 'pão', 'manteiga'], 
    ['cerveja'],                          
    ['manteiga'],                         
    ['pão'],                               
    ['feijão'],                            
    ['arroz', 'feijão'],                  
    ['arroz']                             
]
        
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
    

def get_support(x, y):
    both_occurrence = 0
    for transaction in transactions:
        if x in transaction and y in transaction:
            both_occurrence += 1

    return both_occurrence / len(transactions)

def get_confidence(data, x, y):
    both_occurrence = 0
    x_occurrence = data[x]['qtd']
    
    for transaction in transactions:
        if x in transaction and y in transaction:
            both_occurrence += 1

    return both_occurrence / x_occurrence
    
def format_data(data):
    print('antecedent\tconsequent\tsupport\tconfidence')
    output = []
    
    for item in data:
        for product in data[item]['items']:
            print(f'{item}\t{product['product']}\t{get_support(item, product['product'])}\t{round(get_confidence(data, item, product['product']), 2)}')
            output.append({'antecedent':item, 'consequent':product['product'], 'support':get_support(item, product['product']), 'confidence':round(get_confidence(data, item, product['product']), 2)})

    return output




# ------------------------------------------------------------

all_items = encode_transactions(transactions)
data = get_patterns(all_items, transactions)
formated_data = format_data(data)

print(formated_data)