### Task2 #### join
SELECT 
    c.CustomerID AS CustomerID,
    c.CustomerName AS FullName,
    o.OrderID AS OrderID,
    o.BillAmount AS Cost,
    mi.ItemName AS MenuName,
    ct.Course AS CourseName
FROM
    Customers AS c
        INNER JOIN
    Orders AS o ON c.CustomerID = o.CustomerID
        INNER JOIN
    Menus AS m ON o.MenuID = m.MenuID
        INNER JOIN
    MenuItems AS mi ON m.ItemID = mi.ItemID
        INNER JOIN
    Course AS ct ON mi.CourseID = ct.CourseID
ORDER BY Cost ASC;

#### Task 3 ##### Subquery

SELECT 
    mi.ItemName AS MenuName
FROM
    Menus AS m
        INNER JOIN
    MenuItems AS mi ON m.ItemID = mi.ItemID
WHERE
    m.MenuID = ANY (SELECT 
            MenuID
        FROM
            Orders
        WHERE
            Quantity > 2);

### Prepared Statement ###

Prepare GetOrderDetail from  'Select OrderID , Quantity, BillAmount as Cost from Orders where BookingID = ?' ;

Set @id = 2;
Execute GetOrderDetail using @id ;


