--validation for gold

-- checking duplicate from three customer table after left join

SELECT cst_id, COUNT(*) FROM (
SELECT 
ci.cst_id,
ci.cst_key,
ci.cst_firstname,
ci.cst_lastname,
ci.cst_maritial_status,
ci.cst_gndr,
ci.cst_create_date,
ca.bdate,
ca.gen,
la.cntry
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
ON         ci.cst_key=ca.cid
LEFT JOIN silver .erp_loc_a101 AS la
ON         ci.cst_key = la.cid)t
GROUP BY cst_id
HAVING COUNT(*)>1;-- no duplicate

-- The gender from crm and erp data show some conflict
-- decided that crm is master for gender info
SELECT 
DISTINCT
ci.cst_gndr,
ca.gen,
CASE WHEN ci.cst_gndr!='Unknown' THEN ci.cst_gndr
     ELSE COALESCE(ca.gen,'Unknown')
END AS new_gen
FROM silver.crm_cust_info AS ci
LEFT JOIN silver.erp_cust_az12 AS ca
ON         ci.cst_key=ca.cid
LEFT JOIN silver .erp_loc_a101 AS la
ON         ci.cst_key = la.cid
ORDER BY 1,2;

-- VALIDATION OF NEW VIEW gold.dim_customers
SELECT * FROM gold.dim_customers;


-- check duplicate after join product table from crm and erp 
SELECT prd_key, COUNT(*) FROM (
SELECT 
pn.prd_id,
pn.cat_id,
pn.prd_key,
pn.prd_nm,
pn.prd_cost,
pn.prd_line,
pn.prd_start_dt,
pc.cat,
pc.subcat,
pc.maintenance
FROM silver.crm_prd_info AS pn
LEFT JOIN silver.erp_px_cat_g1v2 AS pc
ON        pn.cat_id = pc.id
WHERE prd_end_dt IS NULL)t
GROUP BY prd_key
HAVING COUNT(*)>1 -- NO DUPLICATE

--validation on ne product view
SELECT * FROM gold.dim_products;
