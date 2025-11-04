export const dynamic = "force-static";

export default function NorthwindErPage() {
  return (
    <section className="mx-auto max-w-5xl px-6 py-10">
      <h1 className="text-2xl font-semibold text-slate-50">Northwind ER 关系概览</h1>
      <p className="mt-2 text-sm text-slate-400">
        下图为常见的 Northwind 实体与关系的简化示意，帮助理解练习题的上下游表。
      </p>
      <div className="mt-4 rounded border border-slate-800 bg-slate-900/60 p-4">
        <pre className="overflow-auto text-xs leading-5 text-slate-200">
{`Customers (CustomerID) ─┬─< Orders (OrderID, CustomerID)
                          │
Employees (EmployeeID) ───┘  

Orders (OrderID) ──< Order Details (OrderID, ProductID, Quantity, UnitPrice)
                             │
Products (ProductID, CategoryID, SupplierID) ─┬──> Categories (CategoryID)
                                              └──> Suppliers (SupplierID)

Orders (ShipVia) ───> Shippers (ShipperID)
`}
        </pre>
      </div>
      <p className="mt-3 text-xs text-slate-400">
        说明：箭头方向指向被引用的主表；“─&lt;” 表示一对多关系（主表 ─&gt; 从表）。
      </p>
    </section>
  );
}

