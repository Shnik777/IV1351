INSERT INTO person(ssn, first_name, last_name)
VALUES
  ('9504131238','Villahermosa','Browning'),
  ('9505241996','Okene','Evans'),
  ('9508201828','Granada','Hyde'),
  ('9504207338','Bonavista','Gentry'),
  ('9512241238','Sevastopol','Mills'),
  ('7004176834','Steve','Smith');
  
INSERT INTO student (student_id, skill) 
VALUES
  ((SELECT person_id from person WHERE ssn='9504131238'), 'beginner' ),
  ((SELECT person_id from person WHERE ssn='9505241996'), 'beginner' ),
  ((SELECT person_id from person WHERE ssn='9508201828'), 'beginner' ),
  ((SELECT person_id from person WHERE ssn='9504207338'), 'advanced' ),
  ((SELECT person_id from person WHERE ssn='9512241238'), 'advanced' );

INSERT INTO contact_details (street, zip, city)
VALUES
  ('779 Quis, Rd.','888436','Voitsberg'),
  ('193-7219 Sapien Ave','785447','Maringá'),
  ('793-8683 Convallis Avenue','248577','Linköping'),
  ('Ap #856-9430 Laoreet, St.','22454','Saint-Nazaire'),
  ('Ap #315-7213 Aliquam Road','4909','Rio Verde'); 
	
INSERT INTO phone ("phone_no")
VALUES
  ('(523) 238-7119'),
  ('1-577-272-3389'),
  ('(239) 553-5181'),
  ('1-738-549-3773'),
  ('1-739-485-3810'),
  ('1-364-816-1338');
  
 INSERT INTO phone (phone_no,contact_id ) 
VALUES
  ('(523) 238-7119', (SELECT contact_id from contact_details WHERE street='779 Quis, Rd.' AND zip='888436' AND city='Voitsberg')),
  ('1-577-272-3389', (SELECT contact_id from contact_details WHERE street='779 Quis, Rd.' AND zip='888436' AND city='Voitsberg')),
  ('(239) 553-5181', (SELECT contact_id from contact_details WHERE street='193-7219 Sapien Ave' AND zip='785447' AND city='Maringá')),
  ('1-738-549-3773', (SELECT contact_id from contact_details WHERE street='793-8683 Convallis Avenue' AND zip='248577' AND city='Linköping')),
  ('1-739-485-3810', (SELECT contact_id from contact_details WHERE street='Ap #856-9430 Laoreet, St.' AND zip='22454' AND city='Saint-Nazaire')),
  ('1-364-816-1338', (SELECT contact_id from contact_details WHERE street='Ap #315-7213 Aliquam Road' AND zip='4909' AND city='Rio Verde'));
  
  INSERT INTO person_contact (person_id,contact_id)
  VALUES
    ((SELECT person_id from person WHERE ssn='9504131238'), (SELECT contact_id from contact_details WHERE street='779 Quis, Rd.' AND zip='888436' AND city='Voitsberg')),
    ((SELECT person_id from person WHERE ssn='9505241996'), (SELECT contact_id from contact_details WHERE street='779 Quis, Rd.' AND zip='888436' AND city='Voitsberg')),
    ((SELECT person_id from person WHERE ssn='9508201828'), (SELECT contact_id from contact_details WHERE street='193-7219 Sapien Ave' AND zip='785447' AND city='Maringá')),
    ((SELECT person_id from person WHERE ssn='9504207338'), (SELECT contact_id from contact_details WHERE street='793-8683 Convallis Avenue' AND zip='248577' AND city='Linköping')),
    ((SELECT person_id from person WHERE ssn='9512241238'), (SELECT contact_id from contact_details WHERE street='Ap #856-9430 Laoreet, St.' AND zip='22454' AND city='Saint-Nazaire')),
    ((SELECT person_id from person WHERE ssn='7004176834'), (SELECT contact_id from contact_details WHERE street='Ap #315-7213 Aliquam Road' AND zip='4909' AND city='Rio Verde'));

INSERT INTO instrument_type(instrument_type)
VALUES
	('guitar'),
	('drums'),
	('bass');

INSERT INTO learning_instrument(student_id, instrument_id)
VALUES
	((SELECT person_id from person WHERE ssn='9504131238'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='9505241996'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='9508201828'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'bass')),
	((SELECT person_id from person WHERE ssn='9504207338'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='9512241238'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'drums'));
	
INSERT INTO teaching_instrument(person_id, instrument_id)
VALUES
	((SELECT person_id from person WHERE ssn='7004176834'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='7004176834'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'bass')),
	((SELECT person_id from person WHERE ssn='7004176834'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'drums'));

INSERT INTO rent_instrument(instrument_type, brand, stock, price)
VALUES
		('guitar', 'Gibson', 5, 500),
		('guitar', 'LTD', 7, 400),
		('bass', 'ESP', 8, 450),
		('drums', 'Ludwig', 1, 800);
		
INSERT INTO timeslot(time_slot, date_slot)
VALUES
		('13:00', '2022-11-26'),
		('14:00', '2022-11-26');

INSERT INTO group_lesson(max_students, min_students, instrument_type, instructor_id, skill_pricing_id, timeslot_id)
VALUES
		(10, 2, 'guitar', (SELECT person_id from person WHERE ssn='7004176834'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='13:00' AND date_slot='2022-11-26'));
		
INSERT INTO private_lesson(instrument_type, instructor_id, student_id, skill_pricing_id, timeslot_id)
VALUES
		('bass', (SELECT person_id from person WHERE ssn='7004176834'), (SELECT person_id from person WHERE ssn='9508201828'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='14:00' AND date_slot='2022-11-26')); 

INSERT INTO group_pricing (group_price_id, payment, price)
VALUES
  ('beginner', 1000, 300),
  ('intermediate', 1500, 400),
  ('advanced', 2000, 500);
  
INSERT INTO private_pricing (private_price_id, payment, price)
VALUES
  ('beginner', 1000, 1100),
  ('intermediate', 1500, 500),
  ('advanced', 2000, 600);  
  
INSERT INTO sibling_discount(sibling_discount)
VALUES
	(100);
	
	--new from last time
	
INSERT INTO person(ssn, first_name, last_name)
VALUES
  ('9404131238','Ville','Svensson'),
  ('9405241996','Olof','Jansson'),
  ('9408201828','Greta','Eriksson'),
  ('9404207338','Emil','Stege'),
  ('9412241238','Bob','Bäck'),
  ('7404176834','Karl','Smith');
  
INSERT INTO student (student_id, skill) 
VALUES
  ((SELECT person_id from person WHERE ssn='9404131238'), 'beginner' ),
  ((SELECT person_id from person WHERE ssn='9405241996'), 'beginner' ),
  ((SELECT person_id from person WHERE ssn='9408201828'), 'beginner' ),
  ((SELECT person_id from person WHERE ssn='9404207338'), 'advanced' ),
  ((SELECT person_id from person WHERE ssn='9412241238'), 'advanced' );

INSERT INTO contact_details (street, zip, city)
VALUES
  ('Ankvägen 7','11499','Stockholm'),
  ('Drottninggatan 18','11121','Stockholm'),
  ('Kungsgatan 1','11191','Linköping'),
  ('Hallebergsvägen 8','16773','Stockholm'),
  ('Vägen 5','15723','Bromma'),
  ('Vägen 7','15723','Bromma'); 
	
INSERT INTO phone ("phone_no")
VALUES
  ('07071241245'),
  ('07321412512'),
  ('07071258856'),
  ('07612319978'),
  ('07235800000'),
  ('07070707070');
  
 INSERT INTO phone (phone_no,contact_id ) 
VALUES
  ('07071241245', (SELECT contact_id from contact_details WHERE street='Ankvägen 7' AND zip='11499' AND city='Stockholm')),
  ('07321412512', (SELECT contact_id from contact_details WHERE street='Drottninggatan 18' AND zip='11121' AND city='Stockholm')),
  ('07071258856', (SELECT contact_id from contact_details WHERE street='Kungsgatan 1' AND zip='11191' AND city='Linköping')),
  ('07612319978', (SELECT contact_id from contact_details WHERE street='Hallebergsvägen 8' AND zip='16773' AND city='Stockholm')),
  ('07235800000', (SELECT contact_id from contact_details WHERE street='Vägen 5' AND zip='15723' AND city='Bromma')),
  ('07070707070', (SELECT contact_id from contact_details WHERE street='Vägen 7' AND zip='15723' AND city='Bromma'));
  
  INSERT INTO person_contact (person_id,contact_id)
  VALUES
    ((SELECT person_id from person WHERE ssn='9404131238'), (SELECT contact_id from contact_details WHERE street='Ankvägen 7' AND zip='11499' AND city='Stockholm')),
    ((SELECT person_id from person WHERE ssn='9405241996'), (SELECT contact_id from contact_details WHERE street='Drottninggatan 18' AND zip='11121' AND city='Stockholm')),
    ((SELECT person_id from person WHERE ssn='9408201828'), (SELECT contact_id from contact_details WHERE street='Kungsgatan 1' AND zip='11191' AND city='Linköping')),
    ((SELECT person_id from person WHERE ssn='9404207338'), (SELECT contact_id from contact_details WHERE street='Hallebergsvägen 8' AND zip='16773' AND city='Stockholm')),
    ((SELECT person_id from person WHERE ssn='9412241238'), (SELECT contact_id from contact_details WHERE street='Hallebergsvägen 8' AND zip='16773' AND city='Stockholm')),
    ((SELECT person_id from person WHERE ssn='7404176834'), (SELECT contact_id from contact_details WHERE street='Vägen 7' AND zip='15723' AND city='Bromma'));


INSERT INTO learning_instrument(student_id, instrument_id)
VALUES
	((SELECT person_id from person WHERE ssn='9404131238'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='9405241996'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='9408201828'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'bass')),
	((SELECT person_id from person WHERE ssn='9404207338'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='9412241238'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'drums'));
	
INSERT INTO teaching_instrument(person_id, instrument_id)
VALUES
	((SELECT person_id from person WHERE ssn='7404176834'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'guitar')),
	((SELECT person_id from person WHERE ssn='7404176834'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'bass')),
	((SELECT person_id from person WHERE ssn='7404176834'), (SELECT instrument_id from instrument_type WHERE instrument_type = 'drums'));
	
INSERT INTO timeslot(time_slot, date_slot)
VALUES
		('17:00', '2022-12-06'),
		('17:00', '2022-12-04'),
		('17:00', '2022-12-07'),
		('17:00', '2022-12-15'),
		('17:00', '2022-12-23'),
		('17:00', '2022-12-22'),
		('17:00', '2022-12-24'),
		('17:00', '2023-01-03'),
		('17:00', '2023-01-07'),
		('17:00', '2023-01-10'),
		('17:00', '2023-01-13');

INSERT INTO group_lesson(max_students, min_students, instrument_type, instructor_id, skill_pricing_id, timeslot_id)
VALUES
		(10, 2, 'guitar', (SELECT person_id from person WHERE ssn='7004176834'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-06')),
		(10, 2, 'bass', (SELECT person_id from person WHERE ssn='7004176834'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-04')),
		(5, 2, 'guitar', (SELECT person_id from person WHERE ssn='7404176834'), 'intermediate', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-07')),
		(10, 2, 'guitar', (SELECT person_id from person WHERE ssn='7404176834'), 'intermediate', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-15')),
		(5, 2, 'drums', (SELECT person_id from person WHERE ssn='7404176834'), 'advanced', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-23')),
		(5, 2, 'guitar', (SELECT person_id from person WHERE ssn='7004176834'), 'advanced', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-22')),
		(10, 2, 'drums', (SELECT person_id from person WHERE ssn='7404176834'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-24')),
		(10, 2, 'guitar', (SELECT person_id from person WHERE ssn='7404176834'), 'intermediate', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2023-01-03'));
		
INSERT INTO private_lesson(instrument_type, instructor_id, student_id, skill_pricing_id, timeslot_id)
VALUES
		('bass', (SELECT person_id from person WHERE ssn='7004176834'), (SELECT person_id from person WHERE ssn='9408201828'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2023-01-07'));

INSERT INTO ensemble(instructor_id, timeslot_id, max_students, min_students, genre)
VALUES
		((SELECT person_id from person WHERE ssn='7004176834'),(SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2023-01-07'),10,2,'rock'),
		((SELECT person_id from person WHERE ssn='7004176834'),(SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2023-01-10'),10,2,'folk'),
		((SELECT person_id from person WHERE ssn='7004176834'),(SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2023-01-13'),10,2,'jazz');
		
INSERT INTO sibling(person_id, sibling_id, discount_id)
VALUES
		((SELECT person_id from person WHERE ssn='9404131238'),(SELECT person_id from person WHERE ssn='9405241996'),1),
		((SELECT person_id from person WHERE ssn='9404131238'),(SELECT person_id from person WHERE ssn='9408201828'),1),
		((SELECT person_id from person WHERE ssn='9405241996'),(SELECT person_id from person WHERE ssn='9404131238'),1),
		((SELECT person_id from person WHERE ssn='9405241996'),(SELECT person_id from person WHERE ssn='9408201828'),1),
		((SELECT person_id from person WHERE ssn='9408201828'),(SELECT person_id from person WHERE ssn='9404131238'),1),
		((SELECT person_id from person WHERE ssn='9408201828'),(SELECT person_id from person WHERE ssn='9405241996'),1),
		((SELECT person_id from person WHERE ssn='9404207338'),(SELECT person_id from person WHERE ssn='9412241238'),1),
		((SELECT person_id from person WHERE ssn='9412241238'),(SELECT person_id from person WHERE ssn='9404207338'),1);
		
INSERT INTO student_ensemble(student_id, ensemble_id)
VALUES
		((SELECT person_id from person WHERE ssn='9504131238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9505241996'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9508201828'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9504207338'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9512241238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9404131238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9405241996'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9408201828'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9404207338'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9412241238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-07' AND time_slot='17:00'));
		
INSERT INTO student_ensemble(student_id, ensemble_id)
VALUES
		((SELECT person_id from person WHERE ssn='9504131238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9505241996'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9508201828'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9504207338'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9512241238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9404131238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9405241996'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9408201828'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9404207338'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-10' AND time_slot='17:00'));

INSERT INTO student_ensemble(student_id, ensemble_id)
VALUES
		((SELECT person_id from person WHERE ssn='9504131238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-13' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9505241996'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-13' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9508201828'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-13' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9504207338'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-13' AND time_slot='17:00')),
		((SELECT person_id from person WHERE ssn='9512241238'), (SELECT ensemble_id from ensemble inner join timeslot on timeslot_id = time_id where date_slot='2023-01-13' AND time_slot='17:00'));

INSERT INTO group_lesson(max_students, min_students, instrument_type, instructor_id, skill_pricing_id, timeslot_id)
VALUES
		(10, 2, 'bass', (SELECT person_id from person WHERE ssn='7404176834'), 'beginner', (SELECT time_id from timeslot WHERE time_slot='17:00' AND date_slot='2022-12-06'));		