INSERT INTO [interfaçage].[dbo].[Article] 
([Code_art]
,[Nom_art]
,[Code_fam]
,[Code_Cat]
,[Code_unite]
,[GereEnStock]
,[GereParLot])
    SELECT 
 A.[ITMREF_0]
,A.[ITMDES1_0]
,A.[TSICOD_1]
,A.[TCLCOD_0]
,A.[STU_0]
,CASE
WHEN A.[STOMGTCOD_0] like '2'
  THEN 'OUI'
ELSE
    'NO'
  END 
,CASE
WHEN A.[LOTMGTCOD_0] like '2'
  THEN 'OUI'
ELSE
    'NO'
  END 
    FROM dbx3v12.DELADEV.ITMMASTER A 
      INNER JOIN dbx3v12.DELADEV.ATABDIV B ON A.TSICOD_1 = B.CODE_0
	 WHERE B.N1_0 ='2' AND B.NUMTAB_0 ='21' AND A.[ITMREF_0] NOT IN (SELECT [Code_art] FROM interfaçage.dbo.Article)

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

  INSERT INTO [interfaçage].[dbo].[Categorie]
([Code_cat]
,[Nom_cat])
    SELECT 
 i.[TCLCOD_0]
,A.[TEXTE_0]
 FROM [dbx3v12].[DELADEV].[ATEXTRA] A 
 INNER JOIN [dbx3v12].[DELADEV].[ITMCATEG] i ON A.IDENT1_0=i.TCLCOD_0
  WHERE A.CODFIC_0='ITMCATEG' AND A.ZONE_0 ='TCLAXX' and i.[TCLCOD_0] NOT IN (SELECT [Code_cat] FROM [interfaçage].[dbo].[Categorie])


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[Unite]
 ([Code_unite]
,[Nom_unite])
  SELECT 
 i.[UOM_0]
,A.[TEXTE_0]
    FROM [dbx3v12].[DELADEV].[ATEXTRA] A 
 INNER JOIN [dbx3v12].[DELADEV].[TABUNIT] i ON A.IDENT1_0=i.UOM_0
 WHERE A.CODFIC_0='TABUNIT' AND A.ZONE_0 ='DES' AND A.LANGUE_0 = 'FRA'
 AND i.[UOM_0] NOT IN (SELECT [Code_unite] FROM [interfaçage].[dbo].[Unite])

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[Famille] 
([Code_fam]
,[Nom_fam])
    SELECT 
 A.[IDENT2_0]
,A.[TEXTE_0]
    FROM  [dbx3v12].[DELADEV].[ATEXTRA] A
	  INNER JOIN dbx3v12.DELADEV.ATABDIV B ON A.IDENT2_0=B.CODE_0
	  WHERE B.N1_0 ='2' AND A.CODFIC_0='ATABDIV' AND A.ZONE_0='LNGDES' AND A.IDENT1_0=21 AND A.[IDENT2_0] NOT IN (SELECT [Code_fam] FROM interfaçage.dbo.Famille)


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[SKU] 
(
Code_sku
,Nom_sku
,Code_marq
,pds_sousEmb
,nbr_sousEmb
,dim_sousEmb
,ref_sousEmb
,pds_com
,pds_pro
,nbr_col
,Avec_film
,typcond
,cout_emb
,valide)
  SELECT
  P.[YITMREF_0],
  K.ITMDES1_0,
  1  ,
       '' ,
	   '' ,
	   ''  ,
	   '' ,
      CASE WHEN P.[PAL] IS NOT NULL AND C.[COL] IS NOT NULL THEN C.[COL] END ,
	    CASE
           WHEN P.[PAL] IS NOT NULL AND C.[COL] IS NOT NULL THEN C.[COL]*1.02
       END  
       ,CASE
           WHEN P.[PAL] IS NOT NULL AND C.[COL] IS NOT NULL THEN P.PAL
       END ,
	   U.YFILM_0,
        S.LANMES_0 ,
		'' ,
CASE WHEN Z.USESTA_0 Like '%2%' then 'Oui' else 'Non' end 
FROM dbx3v12.dbo.YNPAL P
INNER JOIN dbx3v12.dbo.YNCOL C ON P.YITMREF_0 = C.YITMREF_0
LEFT JOIN dbx3v12.dbo.YBAR B ON B.YITMREF_0 = C.YITMREF_0
INNER JOIN dbx3v12.DELADEV.ITMMASTER K ON P.YITMREF_0 = K.ITMREF_0
INNER JOIN dbx3v12.DELADEV.BOM Z  ON P.YITMREF_0 = Z.ITMREF_0
INNER JOIN dbx3v12.dbo.YTYP S ON S.YPF1_0 = K.ITMREF_0
INNER JOIN dbx3v12.dbo.YPK  U ON U.YPF1_0 = Z.ITMREF_0  WHERE  P.[YITMREF_0] NOT IN (SELECT [Code_sku] FROM  [interfaçage].[dbo].[SKU])



/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[D_SKUArticle] 
(
  ID
  ,Code_sku
  ,Nature
  ,Code_art
  ,qte_art
  ,destock
  ,prix_ini
  ,prctg_maj
)
   SELECT
    ID,
    [Code_sku],
    [Nature],
    [Code_art],
    [qte_art],
    [destock],
    [prix_ini] ,
    [prctg_maj]
FROM
[dbx3v12].[dbo].[YD_SKUArticle]  WHERE [ID] NOT IN (SELECT [ID] FROM  [interfaçage].[dbo].[D_SKUArticle])

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[D_SKUVarCmr] 
 (
 [Code_sku]
 ,[Code_varCmr]
 )
 SELECT
  [Code_sku],
 [Code_varCmr]
FROM [dbx3v12].[dbo].[YD_SKUVarCmr] 
WHERE [Code_sku] NOT IN (SELECT [Code_sku] FROM  [interfaçage].[dbo].[D_SKUVarCmr])


----------------------------------------------------------------------------------------------------------------------------------------------------------------*/


 INSERT INTO [interfaçage].[dbo].[VarieteCommerciale] 
 (
 [Code_varcmr]
 ,[Nom_varcmr]
 )
 select 
[ITMREF_0] ,
[ITMDES1_0] 
from [dbx3v12].[DELADEV].[ITMMASTER]
where [ITMREF_0] LIKE 'VAR%'  AND [ITMREF_0] NOT IN (SELECT [Code_varcmr] FROM  [interfaçage].[dbo].[VarieteCommerciale])


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

 INSERT INTO [interfaçage].[dbo].[VarieteChamp]
 (
 [Code_varcmr]
 ,[Code_varchm]
 ,[inti_var]
 )
 select
[YITMREF_0],
[YCODVC_0],
[YVCDES_0] 
from [dbx3v12].[DELADEV].[YITMVARC]  WHERE [YITMREF_0] NOT IN (SELECT [Code_varcmr] FROM  [interfaçage].[dbo].[VarieteChamp])

 
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 INSERT INTO [interfaçage].[dbo].[D_VarieteCommerceCLI]
 (
 ID,
Code_varcmr,
Code_cli,
Code_vardec,
Ctrl_vardec
 )
 select
 ID,
Code_varcmr,
Code_cli,
Code_vardec,
Ctrl_vardec
from [dbx3v12].[dbo].[YD_VarieteCommerceCLI]  WHERE [ID] NOT IN (SELECT [ID] FROM  [interfaçage].[dbo].[D_VarieteCommerceCLI])

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[Client]
(
[Code_cli],
[Nom_cli],
[Ville],
[code_grp]
)
SELECT 
[Code_cli],
[Nom_cli],
[Ville],
[code_grp] 
from [dbx3v12].[dbo].[YClient]  WHERE [Code_cli] NOT IN (SELECT [Code_cli] FROM [interfaçage].[dbo].[Client])
 
 /*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

insert INTO [interfaçage].[dbo].[MgsnCli]
(
[Code_mgs],
[Code_cli],
[Adresse],
[ville],
[tele],
[fax],
[mail],
[nbr_JrTransit],
[ID]
)
 SELECT 
[Code_mgs],
[Code_cli],
[Adresse],
[ville],
[tele],
[fax],
[mail],
[nbr_JrTransit],
[ID] 
from [dbx3v12].[dbo].[YMagasinClient]  WHERE [ID] NOT IN (SELECT [ID] FROM [interfaçage].[dbo].[MgsnCli])

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

INSERT INTO [interfaçage].[dbo].[cmd_annuelle]
(
       [num_prog]
      ,[cod_camp]
      ,[cod_cli]
      ,[cod_contrat]
      ,[typ]
      ,[jr_trans]
      ,[cod_sku]
      ,[num_sem]
      ,[dte_debutSem]
      ,[quantite]
      ,[pds_com]
      ,[version]
      ,[ID]
)
 SELECT 
       [num_prog]
      ,[cod_camp]
      ,[cod_cli]
      ,[cod_contrat]
      ,[typ]
      ,[jr_trans]
      ,[cod_sku]
      ,[num_sem]
      ,[dte_debutSem]
      ,[quantite]
      ,[pds_com]
      ,[version]
      ,[ID]
 FROM [dbx3v12].[dbo].[Ycmd_annuelle] WHERE [ID] NOT IN (SELECT [ID] FROM [interfaçage].[dbo].[cmd_annuelle])

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/


 INSERT INTO [interfaçage].[dbo].[cmd_hebdo]
     ( 
	  [num_cmd]
      ,[dte_cmd]
      ,[dte_dep]
      ,[cod_cli]
      ,[num_PO]
      ,[adres_liv]
      ,[dte_arrive]
      ,[transit_time]
      ,[version]
      ,[etat]
      ,[valid]
      ,[nbr_pal]
      ,[nbr_col]
      ,[pds_prod]
      ,[pds_com]
	 )
SELECT 
      [num_cmd]
      ,[dte_cmd]
      ,[dte_dep]
      ,[cod_cli]
      ,[num_PO]
      ,[adres_liv]
      ,[dte_arrive]
      ,[transit_time]
      ,[version]
      ,[etat]
      ,[valid]
      ,[nbr_pal]
      ,[nbr_col]
      ,[pds_prod]
      ,[pds_com]
	  FROM [dbx3v12].[dbo].[ycmd_hebdo]WHERE [num_cmd] NOT IN (SELECT [num_cmd] FROM [interfaçage].[dbo].[cmd_hebdo])
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

	
    insert INTO [interfaçage].[dbo].[d_cmd_hebdo]
       (
	  [num_cmd]
      ,[id_cmd]
      ,[cod_sku]
      ,[cod_marq]
      ,[cod_VarCmrDec]
      ,[dte_expir]
      ,[film]
      ,[col_pal]
      ,[tot_coli]
      ,[nbr_pal]
      ,[col_refPal]
      ,[palette_mixte]
      ,[ref_PalMixte]
      ,[etat]
      ,[operation]
      ,[ID]
	  )
SELECT
       [num_cmd]
      ,[id_cmd]
      ,[cod_sku]
      ,[cod_marq]
      ,[cod_VarCmrDec]
      ,[dte_expir]
      ,[film]
      ,[col_pal]
      ,[tot_coli]
      ,[nbr_pal]
      ,[col_refPal]
      ,[palette_mixte]
      ,[ref_PalMixte]
      ,[etat]
      ,[operation]
      ,[ID]
   FROM [dbx3v12].[dbo].[Yd_cmd_hebdo] WHERE [ID] NOT IN (SELECT [ID] FROM [interfaçage].[dbo].[d_cmd_hebdo])
 
 
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
