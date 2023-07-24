 	UPDATE [interfaçage].[dbo].[Article]
      SET [Nom_art] = i.[ITMDES1_0] 
      , [Code_fam] = i.[TSICOD_1]
      , [Code_Cat] = i.[TCLCOD_0]
      , [Code_unite] = i.[STU_0]
      , [GereEnStock] = i.[STOMGTCOD_0]
      , [GereParLot] = i.[LOTMGTCOD_0] 
       FROM [interfaçage].[dbo].[Article] A
      INNER JOIN dbx3v12.DELADEV.ITMMASTER i ON A. [Code_art] = i.[ITMREF_0]
      INNER JOIN dbx3v12.DELADEV.ATABDIV B ON i.TSICOD_1=B.CODE_0
	 WHERE B.N1_0 ='2' AND B.NUMTAB_0 ='21'
     
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
UPDATE  [interfaçage].[dbo].[Categorie]
      SET [Nom_cat] = B.[TEXTE_0]
       FROM [interfaçage].[dbo].[Categorie] A
      INNER JOIN [dbx3v12].[DELADEV].[ITMCATEG] i ON A.[Code_cat]= i.[TCLCOD_0]
      INNER JOIN [dbx3v12].[DELADEV].[ATEXTRA] B ON B.IDENT1_0=i.TCLCOD_0
  WHERE B.CODFIC_0='ITMCATEG' AND B.ZONE_0 ='TCLAXX' 

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
 UPDATE [interfaçage].[dbo].[Unite]
      SET [Nom_unite] = B.[TEXTE_0] 
       FROM [interfaçage].[dbo].[Unite] A
      INNER JOIN [dbx3v12].[DELADEV].[TABUNIT] i ON A.[Code_unite] = i.[UOM_0]
     INNER JOIN [dbx3v12].[DELADEV].[ATEXTRA] B  ON B.[IDENT1_0]=i.[UOM_0]
    WHERE B.CODFIC_0='TABUNIT' AND B.ZONE_0 ='DES' AND B.LANGUE_0 = 'FRA'

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 UPDATE [interfaçage].[dbo].[Famille]
      SET [Nom_fam] = i.[TEXTE_0] 
       FROM [interfaçage].[dbo].[Famille] A
      INNER JOIN [dbx3v12].[DELADEV].[ATEXTRA] i ON A. [Code_fam] = i.[IDENT2_0]
	   	  INNER JOIN dbx3v12.DELADEV.ATABDIV B ON i.IDENT2_0=B.CODE_0
	  WHERE B.N1_0 ='2' AND i.CODFIC_0='ATABDIV' AND i.ZONE_0='LNGDES' AND i.IDENT1_0=21
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
UPDATE [interfaçage].[dbo].[SKU]
      SET Code_sku = i.Code_sku
,Nom_sku = i.Nom_sku
,Code_marq = i.Code_marq
,pds_sousEmb = i.pds_sousEmb
,nbr_sousEmb = i.nbr_sousEmb
,dim_sousEmb = i.dim_sousEmb
,ref_sousEmb = i.ref_sousEmb
,pds_com = i.pds_com 
,pds_pro = i.pds_pro
,nbr_col = i.nbr_col
,Avec_film = i.Avec_film
,typcond = i.typcond
,cout_emb = i.cout_emb 
,valide = i.valide
FROM [interfaçage].[dbo].[SKU]  A
INNER JOIN [dbx3v12].[dbo].[SKUH]  i ON A. [Code_sku] = i.[Code_sku]

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
 
UPDATE [interfaçage].[dbo].[D_SKUArticle] 
      SET [Code_sku] = i.[Code_sku] 
      ,[Nature] = i.[Nature]
      ,[Code_art] = i.[Code_art]
      ,[qte_art] = i.[qte_art]
      ,[destock] = i.[destock]
      ,[prix_ini] = i.[prix_ini]
      ,[prctg_maj] = i.[prctg_maj]
       FROM [interfaçage].[dbo].[D_SKUArticle]  A
      INNER JOIN [dbx3v12].[dbo].[YD_SKUArticle]  i ON A. [ID] = i.[ID]

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

UPDATE [interfaçage].[dbo].[D_SKUVarCmr] 
     SET [Code_sku]= i.[Code_sku]
      ,[Code_varCmr] = i.[Code_varCmr]
FROM [interfaçage].[dbo].[D_SKUVarCmr] A
INNER JOIN [dbx3v12].[dbo].[YD_SKUVarCmr]  i ON A.[Code_sku] = i.[Code_sku]

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

 UPDATE [interfaçage].[dbo].[VarieteCommerciale] 
  SET [Nom_varcmr]= i.[ITMDES1_0] 
FROM  [interfaçage].[dbo].[VarieteCommerciale]  A
INNER JOIN [dbx3v12].[DELADEV].[ITMMASTER] i ON A.[Code_varcmr]= i.[ITMREF_0] 
where [ITMREF_0] LIKE 'VAR%'  


/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

 UPDATE [interfaçage].[dbo].[VarieteChamp]
SET [Code_varchm]= i.[YCODVC_0]
 ,[inti_var]= i.[YVCDES_0]
from [interfaçage].[dbo].[VarieteChamp] A
INNER JOIN [dbx3v12].[DELADEV].[YITMVARC]  i ON A.[Code_varcmr]= i.[YITMREF_0]

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/

UPDATE [interfaçage].[dbo].[D_VarieteCommerceCLI]
SET
Code_varcmr= i.Code_varcmr,
Code_cli= i.Code_cli,
Code_vardec= i.Code_vardec,
Ctrl_vardec= i.Ctrl_vardec
from  [interfaçage].[dbo].[D_VarieteCommerceCLI] A
 INNER JOIN [dbx3v12].[dbo].[YD_VarieteCommerceCLI] i on A.ID = i.ID


--Client

UPDATE [interfaçage].[dbo].[Client] 
      SET [Nom_cli] = i.[Nom_cli]
      ,[Ville] = i.[Ville] 
      ,[code_grp] = i.[code_grp]
       FROM [interfaçage].[dbo].[Client] A
      INNER JOIN [dbx3v12].[dbo].[YClient] i ON A.[Code_cli] = i.[Code_cli]


--MagasinClient

UPDATE [interfaçage].[dbo].[MgsnCli] 
      SET [Code_mgs] = i.[Code_mgs] 
      ,[Code_cli] = i.[Code_cli]
      ,[Adresse] = i.[Adresse] 
      ,[ville] = i.[ville]
	  ,[tele] = i.[tele]
	  ,[fax] = i.[fax]
	  ,[mail] = i.[mail]
	  ,[nbr_JrTransit] = i.[nbr_JrTransit]
       FROM [interfaçage].[dbo].[MgsnCli] A
      INNER JOIN [dbx3v12].[dbo].[YMagasinClient] i ON A. [ID] = i.[ID]

--commercial_annuel

UPDATE [interfaçage].[dbo].[cmd_annuelle]
      SET        [num_prog] = i.[num_prog]
                 ,[cod_camp] = i.[cod_camp]
                 ,[cod_cli] = i.[cod_cli]
                 ,[cod_contrat] = i.[cod_contrat]
                 ,[typ] = i.[typ]
                 ,[jr_trans] = i.[jr_trans]
                 ,[cod_sku] = i.[cod_sku]
                 ,[num_sem] = i.[num_sem]
                 ,[dte_debutSem] = i.[dte_debutSem]
                 ,[quantite] = i.[quantite]
                 ,[pds_com] = i.[pds_com]
                 ,[version] = i.[version]
                 ,[ID]  = i.[ID]
       FROM [interfaçage].[dbo].[cmd_annuelle] A
      INNER JOIN [dbx3v12].[dbo].[Ycmd_annuelle] i ON A. [ID] = i.[ID]

--COMMANDE_GROUP

UPDATE [interfaçage].[dbo].[cmd_hebdo]
      SET     [dte_cmd] = i.[dte_cmd]
             ,[dte_dep] = i.[dte_dep]
             ,[cod_cli] = i.[cod_cli]
             ,[num_PO] = i.[num_PO]
             ,[adres_liv] = i.[adres_liv]
             ,[dte_arrive] = i.[dte_arrive]
             ,[transit_time] = i.[transit_time]
             ,[version] = i.[version]
             ,[etat] = i.[etat]
             ,[valid] = i.[valid]
             ,[nbr_pal] = i.[nbr_pal]
             ,[nbr_col] = i.[nbr_col]
             ,[pds_prod] = i.[pds_prod]
             ,[pds_com] = i.[pds_com]
       FROM [interfaçage].[dbo].[cmd_hebdo] A
      INNER JOIN [dbx3v12].[dbo].[ycmd_hebdo] i ON A. [num_cmd] = i.[num_cmd]


---detail cmd
	

	UPDATE [interfaçage].[dbo].[d_cmd_hebdo]
      SET      [num_cmd] = i.[num_cmd]
              ,[id_cmd] = i.[id_cmd]
              ,[cod_sku] = i.[cod_sku]
              ,[cod_marq] = i.[cod_marq]
              ,[cod_VarCmrDec] = i.[cod_VarCmrDec]
              ,[dte_expir] = i.[dte_expir]
              ,[film] = i.[film]
              ,[col_pal] = i.[col_pal]
              ,[tot_coli] = i.[tot_coli]
              ,[nbr_pal] = i.[nbr_pal]
              ,[col_refPal] = i.[col_refPal]
              ,[palette_mixte] = i.[palette_mixte]
              ,[ref_PalMixte] = i.[ref_PalMixte]
              ,[etat] = i.[etat]
              ,[operation] = i.[operation]
       FROM [interfaçage].[dbo].[d_cmd_hebdo] A
      INNER JOIN [dbx3v12].[dbo].[Yd_cmd_hebdo] i ON A. [ID] = i.[ID]
    

