INVENTORY MANAGEMENT SYSTEM — STARTER PROJECT
Workflow: Tkinter GUI -> MySQL -> Python service -> Excel -> Power BI

FILES
01_setup_database.sql   Creates tables and inserts demo data (only if tables are empty)
database.py             MySQL connection settings
app.py                  Tkinter GUI: add/update product, stock IN/OUT/adjustment
background_service.py   Refreshes Excel every 30 seconds
requirements.txt        Python packages

SETUP
1. Extract this ZIP to a folder, e.g. Downloads\Inventory_Management_System.
2. In MySQL Workbench, run 01_setup_database.sql.
   If you already created the tables, this script uses CREATE TABLE IF NOT EXISTS.
   Demo products insert only if products is empty. Demo transactions insert only if transactions is empty.
3. Open database.py. If your MySQL root password is not blank, set it using environment variable IMS_DB_PASSWORD,
   or edit the password default. Do not share your password publicly.
4. Open Command Prompt in the extracted folder and run:
       py -m pip install -r requirements.txt
5. Start the GUI:
       py app.py
6. In a SECOND Command Prompt window, start Excel auto-refresh:
       py background_service.py
   Keep this window running. It updates Inventory_Report.xlsx every 30 seconds.
7. If Excel is open and Windows locks the workbook, close it while the refresh runs.

GUI
- Add Product: enter name and selling price; other fields may be left blank/defaulted.
- Update Selected: select a table row, edit form fields, click Update Selected.
- Stock Movement: select a product; choose IN, OUT, or ADJUSTMENT and quantity.
- For ADJUSTMENT, Quantity means the new absolute stock amount.
- OUT cannot exceed current stock. SKU must be unique.

POWER BI
1. Wait for Inventory_Report.xlsx to be created.
2. Power BI Desktop > Get Data > Excel workbook > select Inventory_Report.xlsx.
3. Load Products and Transactions.
4. Create relationship Products[ProductID] (one) -> Transactions[ProductID] (many).
5. Example measures:
   Total Products = DISTINCTCOUNT(Products[ProductID])
   Total Units = SUM(Products[Stock])
   Inventory Cost Value = SUM(Products[InventoryCostValue])
   Potential Sales Value = SUM(Products[PotentialSalesValue])
   Low Stock Products = CALCULATE(COUNTROWS(Products), Products[StockStatus] = "LOW STOCK")
   Out of Stock Products = CALCULATE(COUNTROWS(Products), Products[StockStatus] = "OUT OF STOCK")
6. Python updates Excel, but Power BI Desktop may need you to click Refresh. Scheduled/cloud refresh requires additional configuration.

NOTE
Demo transactions are illustrative sample history and may not reconcile to the initial stock values. GUI-created stock movements keep current stock and transaction records in sync.
