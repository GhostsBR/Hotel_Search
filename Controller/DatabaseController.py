import MySQLdb

class DatabaseControl:
    conn = MySQLdb.connect(db="proway", host="localhost", user="root")
    cursor = conn.cursor()

    def __init__(self):
        self.verify_hotels()
        self.verify_states()
        self.verify_cities()
        self.conn.commit()

    def verify_hotels(self):
        self.cursor.execute("CREATE TABLE IF NOT EXISTS hotels (id int primary key auto_increment, name varchar(50),"
                            " classify int, slots int, price float, has_academy bool, has_pool bool,"
                            " has_breakfast bool, city int)")

    def verify_states(self):
        self.cursor.execute("CREATE TABLE IF NOT EXISTS states (id int primary key auto_increment, name varchar(50))")

    def verify_cities(self):
        self.cursor.execute("CREATE TABLE IF NOT EXISTS cities (id int primary key auto_increment, name varchar(50),"
                            " region varchar(50), state int)")


class Hotels(DatabaseControl):
    def get_hotel(self, **kwargs):
        list = []
        for key, value in kwargs.items():
            list.append("%s = '%s'" % (key, value))
        find = " and ".join(list)

        try:
            if find == "":
                self.cursor.execute(f"SELECT * FROM hotels WHERE slots > 0 ORDER BY classify DESC LIMIT 10")
            else:
                self.cursor.execute(f"SELECT * FROM hotels WHERE slots > 0 and {find} ORDER BY classify DESC LIMIT 10")
            return self.cursor.fetchall()
        except:
            print("Não foi possível pesquisar o hotel!")
            return ()


class States(DatabaseControl):
    def get_state(self, **kwargs):
        list = []
        for key, value in kwargs.items():
            list.append("%s = '%s'" % (key, value))
        find = " and ".join(list)

        try:
            if find == "":
                self.cursor.execute("SELECT * FROM states")
            else:
                self.cursor.execute(f"SELECT * FROM states WHERE {find}")
            return self.cursor.fetchall()
        except:
            print("Não foi possível pesquisar o estado!")
            return ()

class Cities(DatabaseControl):
    def get_city(self, **kwargs):
        list = []
        for key, value in kwargs.items():
            list.append("%s = '%s'" % (key, value))
        find = " and ".join(list)

        try:
            if find == "":
                self.cursor.execute("SELECT * FROM states")
            else:
                self.cursor.execute(f"SELECT * FROM cities WHERE {find}")
            return self.cursor.fetchall()
        except:
            print("Não foi possível pesquisar a cidade!")
            return ()
