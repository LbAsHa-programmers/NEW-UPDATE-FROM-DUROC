	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'Article',
    @role_name = NULL,
    @supports_net_changes = 1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'Categorie',
    @role_name = NULL,
    @supports_net_changes = 1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'Client',
    @role_name = NULL,
    @supports_net_changes = 1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'D_SKUVarCmr',
    @role_name = NULL,
    @supports_net_changes = 1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'SKU',
    @role_name = NULL,
    @supports_net_changes = 1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'Famille',
    @role_name = NULL,
    @supports_net_changes = 1;

/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'Unite',
    @role_name = NULL,
    @supports_net_changes = 1;
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'VarieteCommerciale',
    @role_name = NULL,
    @supports_net_changes = 1;
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'd_cmd_hebdo',
    @role_name = NULL,
    @supports_net_changes = 1;
/*----------------------------------------------------------------------------------------------------------------------------------------------------------------*/
	EXEC sys.sp_cdc_enable_table
    @source_schema = N'dbo',
    @source_name = N'cmd_hebdo',
    @role_name = NULL,
    @supports_net_changes = 1;



	