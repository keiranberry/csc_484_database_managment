from flask import Flask, jsonify, request
from flask_cors import CORS
from db import getDBConnection
import bcrypt

app = Flask(__name__)
CORS(app)

@app.route("/", methods=["GET"])
def home():
    return jsonify({"message": "Welcome to the Pokemon API!"})

# get all pokemon in the database
@app.route("/pokemon", methods=["GET"])
def getPokemon():
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("SELECT * FROM Pokemon")
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching Pokemon:", e)
        return jsonify({"error": "Failed to fetch Pokemon"}), 500

# get pokemon by type
@app.route("/pokemon/type/<string:typeName>", methods=["GET"])
def getPokemonByType(typeName):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT p.id, p.name
            FROM Pokemon p
            JOIN Type t ON p.TypeOneId = t.Id OR p.TypeTwoId = t.Id
            WHERE t.Name = %s;
        """, (typeName,))
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching Pokemon by type:", e)
        return jsonify({"error": "Failed to fetch Pokemon by type"}), 500

# get pokemon by generation number
@app.route("/pokemon/generation/<int:generationId>", methods=["GET"])
def getPokemonByGeneration(generationId):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT id, name
            FROM Pokemon
            WHERE generationId = %s;
        """, (generationId,))
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching Pokemon by generation:", e)
        return jsonify({"error": "Failed to fetch Pokemon by generation"}), 500

# get weaknesses for pokemon
@app.route("/pokemon/<int:pokemonId>/weaknesses", methods=["GET"])
def getPokemonWeaknesses(pokemonId):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT t.Name
            FROM Type t
            JOIN TypeInteraction ti ON t.Id = ti.StrongType
            WHERE ti.WeakType IN (
                SELECT TypeOneId FROM Pokemon WHERE id = %s
                UNION
                SELECT TypeTwoId FROM Pokemon WHERE id = %s
            );
        """, (pokemonId, pokemonId))
        weaknesses = cursor.fetchall()
        conn.close()
        return jsonify(weaknesses)
    except Exception as e:
        print("Error fetching Pokemon weaknesses:", e)
        return jsonify({"error": "Failed to fetch Pokemon weaknesses"}), 500

# get strengths for pokemon
@app.route("/pokemon/<int:pokemonId>/strengths", methods=["GET"])
def getPokemonStrengths(pokemonId):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT t.Name
            FROM Type t
            JOIN TypeInteraction ti ON t.Id = ti.WeakType
            WHERE ti.StrongType IN (
                SELECT TypeOneId FROM Pokemon WHERE id = %s
                UNION
                SELECT TypeTwoId FROM Pokemon WHERE id = %s
            );
        """, (pokemonId, pokemonId))
        strengths = cursor.fetchall()
        conn.close()
        return jsonify(strengths)
    except Exception as e:
        print("Error fetching Pokemon strengths:", e)
        return jsonify({"error": "Failed to fetch Pokemon strengths"}), 500

# increment count of caught pokemon
@app.route("/pokemon/<int:pokemonId>/catch", methods=["POST"])
def incrementPokemonCaught(pokemonId):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            INSERT INTO Collection (PokemonId, NumberCaught)
            VALUES (%s, 1)
            ON DUPLICATE KEY UPDATE NumberCaught = NumberCaught + 1;
        """, (pokemonId,))
        conn.commit()
        conn.close()
        return jsonify({"message": "Pokemon caught count updated!"}), 200
    except Exception as e:
        print("Error updating caught count:", e)
        return jsonify({"error": "Failed to update caught count"}), 500

# get uncaught pokemon
@app.route("/pokemon/uncaught", methods=["GET"])
def getUncaughtPokemon():
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT p.id, p.name
            FROM Pokemon p
            LEFT JOIN Collection c ON p.id = c.PokemonId
            WHERE c.NumberCaught IS NULL OR c.NumberCaught = 0;
        """)
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching uncaught Pokemon:", e)
        return jsonify({"error": "Failed to fetch uncaught Pokemon"}), 500

# get pokemon by the name of the region
@app.route("/pokemon/region/<string:region>", methods=["GET"])
def getPokemonByRegion(region):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT p.id, p.name
            FROM Pokemon p
            JOIN Region r ON p.GenerationId = r.GenerationId
            WHERE r.name = %s;
        """, (region,))
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching Pokemon by region:", e)
        return jsonify({"error": "Failed to fetch Pokemon by region"}), 500

# get pokemon that a given pokemon is weak to
@app.route("/pokemon/<int:pokemonId>/weak-to", methods=["GET"])
def getPokemonWeakTo(pokemonId):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT DISTINCT p.id, p.name
            FROM Pokemon p
            JOIN TypeInteraction ti ON p.TypeOneId = ti.StrongType OR p.TypeTwoId = ti.StrongType
            WHERE ti.WeakType IN (
                SELECT TypeOneId FROM Pokemon WHERE id = %s
                UNION
                SELECT TypeTwoId FROM Pokemon WHERE id = %s
            );
        """, (pokemonId, pokemonId))
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching weak to Pokemon:", e)
        return jsonify({"error": "Failed to fetch weak to Pokemon"}), 500

# get pokemon that a given pokemon is strong against
@app.route("/pokemon/<int:pokemonId>/strong-against", methods=["GET"])
def getPokemonStrongAgainst(pokemonId):
    try:
        conn = getDBConnection()
        cursor = conn.cursor()
        cursor.execute("""
            SELECT DISTINCT p.id, p.name
            FROM Pokemon p
            JOIN TypeInteraction ti ON p.TypeOneId = ti.WeakType OR p.TypeTwoId = ti.WeakType
            WHERE ti.StrongType IN (
                SELECT TypeOneId FROM Pokemon WHERE id = %s
                UNION
                SELECT TypeTwoId FROM Pokemon WHERE id = %s
            );
        """, (pokemonId, pokemonId))
        pokemonList = cursor.fetchall()
        conn.close()
        return jsonify(pokemonList)
    except Exception as e:
        print("Error fetching weak to Pokemon:", e)
        return jsonify({"error": "Failed to fetch weak to Pokemon"}), 500

@app.route("/login", methods=["POST"])
def login():
    try:
        data = request.get_json()
        username = data.get('username')
        password = data.get('password')

        if not username or not password:
            return jsonify({"error": "Username and password are required"}), 400
        
        conn = getDBConnection()
        cursor = conn.cursor()

        cursor.execute("SELECT * FROM Users WHERE Username = %s", (username,))
        user = cursor.fetchone()

        if user:
            # if the user exists, we check to see if the password is right
            if bcrypt.checkpw(password.encode('utf-8'), user['PasswordHash'].encode('utf-8')):
                conn.close()
                return jsonify({"message": "Login successful!"}), 200
            else:
                conn.close()
                return jsonify({"error": "Incorrect password"}), 401
        else:
            # otherwise, we create the new user
            password_hash = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
            cursor.execute("INSERT INTO Users (Username, PasswordHash) VALUES (%s, %s)", (username, password_hash))
            conn.commit()
            conn.close()

            return jsonify({"message": "User created and logged in!"}), 201

    except Exception as e:
        print("Error during login:", e)
        return jsonify({"error": "Failed to log in"}), 500

if __name__ == "__main__":
    app.run(debug=True)
