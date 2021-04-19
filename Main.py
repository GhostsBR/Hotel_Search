from Controller import DatabaseController
db = DatabaseController
import pandas

def selecthotel():
    city = input("Digite a cidade que deseja procurar o hotel:  ")
    city = city.title()
    try:
        city_result = db.Cities().get_city(name=city)
    except:
        print("Não foi possível localizar a cidade com o nome informado!")
        selecthotel()
    try:
        city_result = db.Cities().get_city(region=city_result[0][2], state=city_result[0][3])
    except:
        print("Não foi possível localizar a cidade com a região selecionada!")
        selecthotel()
    if city_result == ():
        print("Não foi possível localizar a cidade informada!")
        selecthotel()
    hotel_result = []
    region = city_result[0][2]
    for i in city_result:
        hotel_result.append(db.Hotels().get_hotel(city=i[0]))

    print("=" * 60)
    print(f"LISTA DA HOTEIS NA REGIÃO {region}:")
    star_ordened_list = [[],[],[],[],[]]
    for i in range(len(hotel_result)):
        for x in range(len(hotel_result[i])):
            star_ordened_list[hotel_result[i][x][2] - 1].append(hotel_result[i][x])
    count = 0
    for i in range(len(star_ordened_list) - 1, 0, -1):
        for x in range(len(star_ordened_list[i])):
            if count > 9:
                break
            print(f"NOME: {star_ordened_list[i][x][1]} \t CATEGORIA: {'★' * int(star_ordened_list[i][x][2])} \t\t VAGAS: {star_ordened_list[i][x][3]} \t PREÇO POR NOITE: R${star_ordened_list[i][x][4]} \t ACADEMIA: {'sim' if bool(star_ordened_list[i][x][5]) else 'não'} \t PISCINA: {'sim' if bool(star_ordened_list[i][x][6]) else 'não'} \t REFEIÇÃO INCLUSA: {'sim' if bool(star_ordened_list[i][x][7]) else 'não'}")
            count += 1
    print("=" * 60)
    input("Pressione ENTER para continuar...")
    selecthotel()

selecthotel()