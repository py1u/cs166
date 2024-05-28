\dt

CREATE TABLE musicians (ssn INTEGER, name TEXT, PRIMARY KEY(ssn));

CREATE TABLE insturment (instr_id INTEGER, dname TEXT, key INTEGER, PRIMARY KEY(instr_id));

CREATE TABLE plays (ssn INTEGER, instr_id INTEGER, PRIMARY KEY(ssn, instr_id), FOREIGN KEY (ssn) REFERENCES musicians(ssn), FOREIGN KEY (instr_id) REFERENCES insturment(instr_id));

CREATE TABLE album (album_id INTEGER, copyrightDate DATE, speed INTEGER, title TEXT, PRIMARY KEY(album_id), FOREIGN KEY (ssn) REFERENCES musicians(ssn));

CREATE TABLE songs (song_id INTEGER, author TEXT, title TEXT, PRIMARY KEY(song_id), FOREIGN KEY (ssn) REFERENCES musicians(ssn), FOREIGN KEY (album_id) REFERENCES album(album_id));

CREATE TABLE place (address STRING, PRIMARY KEY (address));

CREATE TABLE lives (ssn INTEGER, FOREIGN KEY (address) REFERENCES place(address), FOREIGN KEY (ssn) REFERENCES musicians(ssn) ON DELETE CASCADE);

CREATE TABLE telephone (phone_no INTEGER, FOREIGN KEY (address) REFERENCES place(address) ON DELETE NO ACTION);

CREATE TABLE home (address TEXT, phone_no INTEGER, FOREIGN KEY (address) REFERENCES place(ad
dress) ON DELETE NO ACTION);

CREATE TABLE perform (ssn INTEGER, song_id INTEGER, PRIMARY KEY(ssn, song_id), FOREIGN KEY (ssn) REFERENCES musicians(ssn), FOREIGN KEY (song_id) REFERENCES songs(song_id) ON DELETE NO ACTION);

CREATE TABLE producer (ssn INTEGER, album_id INTEGER, PRIMARY KEY(ssn, album_id), FOREIGN KEY (ssn) REFERENCES musicians(ssn), FOREIGN KEY (album_id) REFERENCES album(album_id) ON DELETE CASCADE);

\q