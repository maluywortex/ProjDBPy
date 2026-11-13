import os

try:
    import mysql.connector
except ImportError:
    mysql = None
else:
    mysql = mysql.connector


def _mysql_connection():
    if mysql is None:
        raise RuntimeError(
            "mysql-connector-python n'est pas installé. "
            "Installe-le avec : pip install mysql-connector-python"
        )

    return mysql.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "root"),
        password=os.getenv("DB_PASSWORD", "root"),
        database=os.getenv("DB_NAME", "mydb"),
    )


def save_result(exercice, pseudo, nb_essais, nb_reussites, duree=0):
    pseudo = (pseudo or "Anonyme").strip() or "Anonyme"
    exercice = (exercice or "Inconnu").strip() or "Inconnu"

    duree_secondes = max(0, int(duree))
    minutes, secondes = divmod(duree_secondes, 60)
    duree_texte = f"{minutes:02d}:{secondes:02d}"

    connection = _mysql_connection()
    cursor = None
    try:
        cursor = connection.cursor()

        cursor.execute(
            """
            INSERT IGNORE INTO `User` (`username`, `password`, `role_level`)
            VALUES (%s, '', 0)
            """,
            (pseudo,),
        )
        cursor.execute(
            "SELECT `id` FROM `User` WHERE `username` = %s",
            (pseudo,),
        )
        user_row = cursor.fetchone()
        if user_row is None:
            raise RuntimeError(f"Impossible de retrouver l'utilisateur {pseudo!r}.")
        user_id = user_row[0]

        cursor.execute(
            """
            INSERT IGNORE INTO `Exercice` (`name`)
            VALUES (%s)
            """,
            (exercice,),
        )
        cursor.execute(
            "SELECT `id` FROM `Exercice` WHERE `name` = %s",
            (exercice,),
        )
        exercise_row = cursor.fetchone()
        if exercise_row is None:
            raise RuntimeError(f"Impossible de retrouver l'exercice {exercice!r}.")
        exercise_id = exercise_row[0]

        cursor.execute(
            """
            INSERT INTO `Result`
                (`Users_id`, `Exercices_idExercices`, `date_time`,
                 `duration`, `nb_tries`, `nb_win`)
            VALUES (%s, %s, NOW(), %s, %s, %s)
            """,
            (user_id, exercise_id, duree_texte, nb_essais, nb_reussites),
        )
        connection.commit()
        return True
    except Exception:
        connection.rollback()
        raise
    finally:
        if cursor is not None:
            cursor.close()
        connection.close()
