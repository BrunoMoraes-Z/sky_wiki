import win32clipboard
from PIL import ImageGrab
from pyautogui import press
import pyautogui
import uuid
import json
import time

#
# Para Poder adicionar de maneira mais facil novos itens.
#
# 1º Execute o arquivo, o mesmo ficara em loop
# 2º Informe o nome do item e prescione ENTER
# 3º tire um print do icone e deixe a imagem salva no CTRL+C (com lightshot é simples)
# 4º prescione ENTER no terminal e repita o mesmo processo do passo 3º mas agora para o resultado do craft
# 5º Informe material por material da seguinte maneira ->     QTD x NOME
#                                 exemplo: 128 x Madeira da Selva
# 6º para finalizar a receita basta prescionar ENTER quando Tiver na adição de um material para finalizar a receita &
# ENTER quando estiver informando o nome do item para finalizar a criação de novos itens e finalizar o programa.
#

def showPrintArea(x, y):
    press("printscreen")
    df = 100
    pyautogui.mouseDown(button='left', x=df, y=df)
    pyautogui.mouseDown(button='left', x=df + x, y=df + y)
    pyautogui.mouseUp(button='left', x=df + x, y=df + y)

def savePrint(tp:str, uid: str):
    im = ImageGrab.grabclipboard()
    im.save(f'./images/{tp}-{uid}.png','PNG')

itens = []
content = {}

with open('recipes.json', 'r', encoding='utf8') as r:
    data = r.read()
    content = json.loads(data)

print(f'Receitas Atuais: {len(content["recipes"])}')

while True:
    uid = uuid.uuid4()
    name = input('Nome Do Item: ')
    if name == '':
        break
    showPrintArea(31, 31)
    tmp = input('Icone:')
    savePrint('item', uid.__str__())
    showPrintArea(317, 171)
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

print(' ')
print('-'*60)
print(' ')
print(f'Novos Itens Criados: {len(itens)}')
print(' ')
print('Salvando Arquivo')
for r in itens:
    content['recipes'].append(r)
# with open('recipes.json', 'w', encoding='utf8') as f:
    # json.dump(content, f, ensure_ascii=False)