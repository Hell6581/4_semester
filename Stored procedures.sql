delimiter $$
create procedure EmpSalesYear (in salesyear int)

begin 
	select 
		employees.LastName,
        sum(orderdetails.UnitPrice * orderdetails.Quantity) as Total
	From employees join orders
    on employees.EmployeeID = orders.EmployeeID 
    join orderdetails
    on orders.OrderID = orderdetails.OrderID
    where year(orders.OrderData) = salesyear
    group by employees.LastName
    order by Total desc;
end $$

delimiter ;

CALL EmpSalesYear(1997);