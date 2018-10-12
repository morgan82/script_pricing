DECLARE
  type countryarray IS VARRAY(8) OF VARCHAR2(2);
  type typearray IS VARRAY(4) OF VARCHAR2(30);
  type channelarray IS VARRAY(6) OF VARCHAR2(11);
  indexid NUMBER := 1;
  total NUMBER := 0;
  country countryarray;
  typename typearray;
  channel channelarray;

BEGIN
  country := countryarray('AR', 'CL', 'PE', 'EC', 'CA', 'VE', 'UY', 'CO');
  typename:= typearray('PREPAGO', 'POSTPAGO', 'NET', 'BUNDLE');
  channel:= channelarray('WEB','SMS','IVR','WHATSAPP','RETENCIONES','MIDIRECTV');

  FOR i in 1 .. country.count LOOP
    FOR j in 1 .. typename.count LOOP
      FOR k in 1 .. channel.count LOOP
        INSERT INTO DTV_CROSS_CONTEXT (ID_CONTEXT, COUNTRY, TYPE, CHANNEL) VALUES (indexid, country(i), typename(j),channel(k));
        indexid := indexid + 1;
      END LOOP;
    END LOOP;
  END LOOP;

  Insert into DTV_CROSS_RESOURCES (ID_RESOURCE,NAME,TYPE) values (1,'360','SOAP');
  Insert into DTV_CROSS_RESOURCES (ID_RESOURCE,NAME,TYPE) values (2,'SAS','DB');
  Insert into DTV_CROSS_RESOURCES (ID_RESOURCE,NAME,TYPE) values (3,'EVENTO','SOAP');
  Insert into DTV_CROSS_RESOURCES (ID_RESOURCE,NAME,TYPE) values (4,'ANTIQUITY','SOAP');

  total := country.count * typename.count * channel.count;

  FOR i in 1 .. total LOOP
    INSERT INTO DTV_CROSS_CONTEXT_RESOURCES (FK_RESOURCE, FK_CONTEXT) VALUES (1, i);
    INSERT INTO DTV_CROSS_CONTEXT_RESOURCES (FK_RESOURCE, FK_CONTEXT) VALUES (2, i);
    INSERT INTO DTV_CROSS_CONTEXT_RESOURCES (FK_RESOURCE, FK_CONTEXT) VALUES (3, i);
    INSERT INTO DTV_CROSS_CONTEXT_RESOURCES (FK_RESOURCE, FK_CONTEXT) VALUES (4, i);
  END LOOP;
END;
/