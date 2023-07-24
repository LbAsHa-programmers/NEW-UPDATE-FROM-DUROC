delete [interfaçage].[dbo].[Article] 
    WHERE   [Code_art] NOT IN (
        SELECT [ITMREF_0] FROM dbx3v12.DELADEV.ITMMASTER A 
      INNER JOIN dbx3v12.DELADEV.ATABDIV B ON A.TSICOD_1=B.CODE_0
	 WHERE B.N1_0 ='2' AND B.NUMTAB_0 ='21' );
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
delete [interfaçage].[dbo].[Unite] 
    WHERE [Code_unite] NOT IN (SELECT i.[UOM_0] FROM [dbx3v12].[DELADEV].[ATEXTRA] A 
 INNER JOIN [dbx3v12].[DELADEV].[TABUNIT] i ON A.IDENT1_0=i.UOM_0
 WHERE A.CODFIC_0='TABUNIT' AND A.ZONE_0 ='DES' AND A.LANGUE_0 = 'FRA');
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

  delete [interfaçage].[dbo].[Categorie]
    WHERE [Code_cat] NOT IN (SELECT i.[TCLCOD_0] FROM  [dbx3v12].[DELADEV].[ATEXTRA] A 
 INNER JOIN [dbx3v12].[DELADEV].[ITMCATEG] i ON A.IDENT1_0=i.TCLCOD_0
  WHERE A.CODFIC_0='ITMCATEG' AND A.ZONE_0 ='TCLAXX' );
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
delete [interfaçage].[dbo].[Famille] 
     WHERE  [Code_fam] not IN ( SELECT A.[IDENT2_0] FROM [dbx3v12].[DELADEV].[ATEXTRA] A
	  INNER JOIN dbx3v12.DELADEV.ATABDIV B ON A.IDENT2_0=B.CODE_0
	  WHERE B.N1_0 ='2' AND A.CODFIC_0='ATABDIV' AND A.ZONE_0='LNGDES' AND A.IDENT1_0=21)


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
delete [interfaçage].[dbo].[SKU] 
     WHERE  Code_sku not IN ( SELECT [Code_sku] FROM [dbx3v12].[dbo].[SKUH])
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

delete [interfaçage].[dbo].[D_SKUArticle] 
     WHERE  ID not IN ( SELECT [ID] FROM [dbx3v12].[dbo].[YD_SKUArticle])
    /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

delete [interfaçage].[dbo].[D_SKUVarCmr] 
     WHERE  [Code_sku] not IN ( SELECT [Code_sku] FROM [dbx3v12].[dbo].[YD_SKUVarCmr] )
 
    /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

delete [interfaçage].[dbo].[VarieteCommerciale]
     WHERE  [Code_varcmr] not IN ( SELECT [ITMREF_0] FROM [dbx3v12].[DELADEV].[ITMMASTER] 
	  where [ITMREF_0] LIKE 'VAR%')

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/


delete [interfaçage].[dbo].[VarieteChamp]
     WHERE  [Code_varcmr] not IN ( SELECT [YITMREF_0] FROM [dbx3v12].[DELADEV].[YITMVARC])

      
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

delete [interfaçage].[dbo].[D_VarieteCommerceCLI] 
     WHERE  [ID] not IN ( SELECT [ID] FROM [dbx3v12].[dbo].[YD_VarieteCommerceCLI] )

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

--Client

delete [interfaçage].[dbo].[Client]
     WHERE  [Code_cli] not IN ( SELECT [Code_cli] FROM [dbx3v12].[dbo].[YClient])

--MagasinClient


delete [interfaçage].[dbo].[MgsnCli]
     WHERE  [ID] not IN ( SELECT [ID] FROM [dbx3v12].[dbo].[YMagasinClient])


--commercial_annuel

delete [interfaçage].[dbo].[cmd_annuelle]
     WHERE  [ID] not IN ( SELECT [ID] FROM [dbx3v12].[dbo].[Ycmd_annuelle])

--COMMANDE_GROUP

delete [interfaçage].[dbo].[cmd_hebdo]
     WHERE  [num_cmd] not IN ( SELECT [num_cmd] FROM [dbx3v12].[dbo].[ycmd_hebdo])

---detail cmd
	
     delete [interfaçage].[dbo].[d_cmd_hebdo]
     WHERE  [ID] not IN ( SELECT [ID] FROM [dbx3v12].[dbo].[Yd_cmd_hebdo])
