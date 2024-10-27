INSERT INTO petPet VALUES
  ("Hammy", "Diane", "hamster", "M", "2010-10-30", NULL);

INSERT INTO petEvent VALUES
    ("Fluffy", "2020-10-15", "vet", "antibiotics"),
    ("Hammy", "2020-10-15", "vet", "antibiotics"),
    ("Puffball", "2020-09-01", "death", NULL);

UPDATE petEvent
  SET remark = "5 kittens, 3 female, 2 male"
  WHERE petname = "Fluffy"
  AND eventtype = "litter";

UPDATE petEvent
  SET petname = "Claws"
  WHERE eventdate = "1997-08-03";

DELETE FROM petEvent
  WHERE petName = "Buffy";

DELETE FROM petPet
  WHERE petName = "Buffy";