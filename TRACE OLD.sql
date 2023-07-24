INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'Article'  ,
   'DUROC' ,
   '1' ,
   C.[Code_art],
 CASE
   WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
  'x3-easy',
    NULL
 FROM [cdc].[dbo_Article_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
 WHERE C.[__$operation] IN (1,2,3)

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'CMD_GRP'  ,
   'DUROC' ,
   '1' ,
   C.[Numcomm],
 CASE 
     WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
   'x3-easy',
    NULL
 FROM [cdc].[dbo_CMD_GRP_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
WHERE C.[__$operation] IN (1,2,3)


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'Categorie'  ,
   'DUROC' ,
   '1' ,
   C.[Code_cat],
 CASE 
       WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
  'x3-easy',
    NULL
 FROM [cdc].[dbo_Categorie_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
 WHERE C.[__$operation] IN (1,2,3)

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'Client'  ,
   'DUROC' ,
   '1' ,
   C.[Code_cli],
 CASE 
     WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
   'x3-easy',
    NULL
 FROM [cdc].[dbo_Client_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
WHERE C.[__$operation] IN (1,2,3)


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'D_SKUVarCmr'  ,
   'DUROC' ,
   '1' ,
   C.[Code_sku],
 CASE 
     WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
   'x3-easy',
    NULL
 FROM [cdc].[dbo_D_SKUVarCmr_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
WHERE C.[__$operation] IN (1,2,3)

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'Famille'  ,
   'DUROC' ,
   '1' ,
   C.[Code_fam],
 CASE 
     WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
   'x3-easy',
    NULL
 FROM [cdc].[dbo_Famille_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
WHERE C.[__$operation] IN (1,2,3)


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'SKU'  ,
   'DUROC' ,
   '1' ,
   C.[Code_sku],
 CASE 
       WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
  'x3-easy',
    NULL
 FROM [cdc].[dbo_SKU_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
 WHERE C.[__$operation] IN (1,2,3)

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'Unite'  ,
   'DUROC' ,
   '1' ,
   C.[Code_unite],
 CASE 
    WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
 'x3-easy',
    NULL 
 FROM [cdc].[dbo_Unite_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
WHERE C.[__$operation] IN (1,2,3)

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 INSERT INTO [interfaçage].[dbo].[Transfert]
([Table],
[Code_site],
[Num_inf],
[Numero],
[Operation],
[Date_maj] ,
[Date_synch] ,
[Sens],
[Anomalie])
SELECT 
   'VarieteCommerciale'  ,
   'DUROC' ,
   '1' ,
   C.[Code_varcmr],
 CASE 
     WHEN C.[__$operation] =1  THEN 'S'
    WHEN C.[__$operation] =2  THEN 'A'
    WHEN C.[__$operation] =3  THEN 'M'
   END ,
   T.tran_begin_time,
   NULL ,
   'x3-easy',
    NULL
 FROM [cdc].[dbo_VarieteCommerciale_CT] C
 INNER JOIN [cdc].[lsn_time_mapping] T
 ON  C.[__$start_lsn] = T.[start_lsn]
WHERE C.[__$operation] IN (1,2,3)




/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

