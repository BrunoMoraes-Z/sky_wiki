import win32clipboard
from PIL import ImageGrab
import uuid
import json

def savePrint(tp:str, uid: str):
    im = ImageGrab.grabclipboard()
    im.save(f'./images/{tp}-{uid}.png','PNG')

itens = []
content = {}

with open('recipes.json') as r:
    data = r.read()
    content = json.loads(data)

print(f'Receitas Atuais: {len(content["recipes"])}')

while True:
    uid = uuid.uuid4()
    name = input('Nome Do Item: ')
    if name == '':
        break
    tmp = input('Icone:')
    savePrint('item', uid.__str__())
    tmp = input('Recipe:')
    savePrint('recipe', uid.__str__())
    its = []
    while True:
        inp = input('Material: ')
        if inp == '':
            break
        else:
            its.append(inp)
    print('-'*60)
    item = {
        'id': uid.__str__(),
        'item_name': name,
        'recipe_ingredients': its
    }
    itens.append(item)
    print(item)
    print('-'*60)

# itens.append({
#     'id': '69d56a88-2d6e-4f60-86db-2ace1d5f76b2',
#         'item_name': 'Portal para Fazenda',
#         'recipe_ingredients': [
#             '48 x Cenouras',
#             '80 x Batatas',
#             '16 x Pérolas do Fim'
#         ]
# })
print(' ')
print('-'*60)
print(' ')
print(f'Novos Itens Criados: {len(itens)}')
print(' ')
print('Salvando Arquivo')
for r in itens:
    content['recipes'].append(r)
with open('recipes.json', 'w', encoding='utf8') as f:
    json.dump(content, f, ensure_ascii=False)
