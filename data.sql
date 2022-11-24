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
  