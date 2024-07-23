create or replace view actions_in_branches as
select ac.actionname, ac.actionsum, balance, branchid, aco.accountId, customer_name, c.customer_id from actions ac
join activity act on ac.actionid = act.actionid
join acount aco on aco.accountid = act.accountid
join customers c on c.customer_id = act.customer_id

--Query one
-- sum of all actions group by branch and locations
SELECT 
  l.location_name, 
  b.BranchId, 
  SUM(aib.ActionSum) AS total_action_sum
FROM 
  actions_in_branches aib
JOIN 
  Branch b ON aib.BranchId = b.BranchId
JOIN 
  Locations l ON b.location_id = l.location_id
GROUP BY 
  l.location_name, 
  b.BranchId;

SELECT 
  l.location_name, 
  b.BranchId, 
  COUNT(DISTINCT aib.customer_id) AS customer_count
FROM 
  actions_in_branches aib
JOIN 
  Branch b ON aib.BranchId = b.BranchId
JOIN 
  Locations l ON b.location_id = l.location_id
GROUP BY 
  l.location_name, 
  b.BranchId;
