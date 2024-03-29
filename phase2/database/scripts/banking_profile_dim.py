from params import params

class BankingProfileDim:
    # SQL scripts related to banking profile dimension
    table_name = "banking_profile_dim"

    # SQL command to create banking profile dimension table
    create_table = f"""CREATE TABLE {table_name} (
        bank_profile_key SERIAL PRIMARY KEY,
        tenure SMALLINT NOT NULL,
        active_member SMALLINT NOT NULL,
        products_number SMALLINT NOT NULL,
        balance FLOAT NOT NULL,
        complain SMALLINT NOT NULL
    );"""

    # SQL command to drop banking profile dimension table
    drop_table = f"""DROP TABLE IF EXISTS {table_name};"""

    # SQL command to add data from CSV
    add_data = f"""COPY {table_name}(bank_profile_key, tenure, active_member, products_number, balance, complain)
    FROM '{f'{params.tmp_dir + params.banking_profile_dim_csv}'}'
    DELIMITER ','
    CSV HEADER;"""