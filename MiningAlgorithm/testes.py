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
    
    encoded_data = []
    for transaction in transactions:
        encoded_data.append({item: (item in transaction) for item in all_items})
    
    get_patterns(all_items, transactions)
    
def get_patterns(all_items, transactions):
    items_dict = {}

    # Percorre cada item do dicionário
    for item in all_items:
        items_dict[item] = {'qtd':0, 'items': []}
        
        # Percorre as transações buscando se contem o item
        for transaction in transactions:
            
            # Se tiver o item na transação
            if item in transaction:
                items_dict[item]['qtd'] += 1
                
                # Percorre por cada item da transação
                for product in transaction:
                    if product != item:
                        product_index = get_index_by_product(items_dict[item]['items'], product)
                        
                        if product_index != -1:
                            items_dict[item]['items'][get_index_by_product(items_dict[item]['items'], product)]['qtd'] += 1
                        else:
                            items_dict[item]['items'].append({'product': product, 'qtd': 1})
                            
    # print_dict(items_dict)
    print_result(items_dict)
    

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
    
def print_result(data):
    print('antecedent\tconsequent\tsupport\tconfidence')
    output = []
    
    for item in data:
        for product in data[item]['items']:
            print(f'{item}\t{product['product']}\t{get_support(item, product['product'])}\t{round(get_confidence(data, item, product['product']), 2)}')
            output.append({'antecedent':item, 'consequent':product['product'], 'support':get_support(item, product['product']), 'confidence':round(get_confidence(data, item, product['product']), 2)})


encode_transactions(transactions)