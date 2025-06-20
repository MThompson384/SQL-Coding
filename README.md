# 🗄️ SQL Database Design & Analysis
**Course assignments exploring database architecture, complex queries, and data management**

Ever wondered how airports manage flight data across multiple terminals or how retail companies track sales across regions? I tackled these exact challenges by utilizing advanced SQL techniques to design normalized databases and extract meaningful business insights.
Through this coursework, I developed comprehensive database solutions spanning schema design, complex joins, nested queries, and data warehousing - demonstrating practical experience with enterprise-level data management.

## 🎯 The Problem That Caught My Attention

While exploring database management, I discovered that modern organizations face three critical challenges:
- **Data Relationships:** How do you design schemas that efficiently connect complex business entities?
- **Query Performance:** How do you extract insights from multi-table datasets without sacrificing speed?
- **Business Intelligence:** How do you transform raw transactional data into actionable business metrics?

I thought: "These sound like exactly the kind of problems SQL could solve!"*

## 🚀 What I Built

### ✈️ [Airport Operations Database](https://github.com/MThompson384/SQL-Coding/blob/main/Airports.sql)
Multi-terminal flight operations database utilizing normalized design
- **Relational schema** with terminals, airlines, and departure tracking
- **Complex joins** linking flight operations across terminal assignments
- **Aggregate analysis** calculating total departures by terminal and airline
- **Nested queries** identifying terminals with maximum flight activity

### 📚 [Publishing House Database](https://github.com/MThompson384/SQL-Coding/blob/main/MC5_Signum_Libri%20Example.sql)
Literary management system utilizing advanced relationships
- **Multi-entity design** connecting agents, writers, editors, and books
- **Self-referencing relationships** for editor mentorship hierarchies
- **Schema modifications** with ALTER TABLE operations for database evolution
- **Referential integrity** ensuring data consistency across all entities

### 🏪 [Retail Data Warehouse](https://github.com/MThompson384/SQL-Coding/blob/main/Zagi%20DW.sql)
E-commerce analytics platform utilizing dimensional modeling
- **Star schema design** with fact and dimension tables for sales analysis
- **Geographic tracking** linking customers, stores, and regional performance
- **Product categorization** organizing inventory by vendor and category
- **Business intelligence** views for multi-transaction product analysis

## 🛠️ Technical Skills I Utilized

**Database Design:** Normalized schemas with primary keys, foreign keys, and referential integrity

**Complex Queries:**  Multi-table joins, subqueries, aggregate functions, and nested SELECT statements

**Data Analysis:** GROUP BY operations, HAVING clauses, and statistical functions for business insights

**Schema Management:** CREATE, ALTER, DROP operations with proper constraint handling

## 📊 Key Results

- ✈️ **Multi-terminal operations** tracking 8+ airlines across 3 terminals with 50+ gates
- 📚 **Publishing workflow** managing author-agent-editor relationships with hierarchical mentoring
- 🏪 **Sales analytics** processing transactions across multiple regions and product categories

## 🚀 Quick Start

```bash
sql

-- Complex nested query example
SELECT numberofgates FROM terminal WHERE terminalid =
(SELECT terminalid FROM airline WHERE airlineid=
(SELECT airlineid FROM departure
WHERE numberofdepartingflights =
(SELECT max(numberofdepartingflights) FROM departure)));

-- Business intelligence view
CREATE VIEW products_in_multiple_trnsc AS
SELECT productid, productname, productprice
FROM product
WHERE productid IN
    (SELECT productid
     FROM includes
     GROUP BY productid
     HAVING count(*) > 1);
