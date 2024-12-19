// Create investors (Person)
CREATE (:Person {name: 'Alice', age: 35}),
       (:Person {name: 'Bob', age: 40}),
       (:Person {name: 'Charlie', age: 28}),
       (:Person {name: 'Diana', age: 30}),
       (:Person {name: 'Eve', age: 50});

// Create assets (Asset)
CREATE (:Asset {name: 'PETR4', type: 'Stock'}),
       (:Asset {name: 'Bitcoin', type: 'Cryptocurrency'}),
       (:Asset {name: 'HGLG11', type: 'Real Estate Fund'}),
       (:Asset {name: 'Treasury Selic', type: 'Fixed Income'}),
       (:Asset {name: 'Ethereum', type: 'Cryptocurrency'}),
       (:Asset {name: 'ABEV3', type: 'Stock'}),
       (:Asset {name: 'SHFI11', type: 'Real Estate Fund'}),
       (:Asset {name: 'CDB High Yield', type: 'Fixed Income'});

// Create categories (Category)
CREATE (:Category {name: 'Stocks'}),
       (:Category {name: 'Cryptocurrencies'}),
       (:Category {name: 'Real Estate Funds'}),
       (:Category {name: 'Fixed Income'});

// Link assets to categories (BELONGS_TO)
MATCH (a:Asset {name: 'PETR4'}), (c:Category {name: 'Stocks'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'Bitcoin'}), (c:Category {name: 'Cryptocurrencies'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'HGLG11'}), (c:Category {name: 'Real Estate Funds'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'Treasury Selic'}), (c:Category {name: 'Fixed Income'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'Ethereum'}), (c:Category {name: 'Cryptocurrencies'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'ABEV3'}), (c:Category {name: 'Stocks'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'SHFI11'}), (c:Category {name: 'Real Estate Funds'})
CREATE (a)-[:BELONGS_TO]->(c);

MATCH (a:Asset {name: 'CDB High Yield'}), (c:Category {name: 'Fixed Income'})
CREATE (a)-[:BELONGS_TO]->(c);

// Create brokers (Broker)
CREATE (:Broker {name: 'XP Investments'}),
       (:Broker {name: 'Binance'}),
       (:Broker {name: 'Nubank Investments'}),
       (:Broker {name: 'Inter Investments'}),
       (:Broker {name: 'Coinbase'});

// Link brokers to assets (OFFERS)
MATCH (b:Broker {name: 'XP Investments'}), (a:Asset {name: 'PETR4'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'XP Investments'}), (a:Asset {name: 'HGLG11'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'Binance'}), (a:Asset {name: 'Bitcoin'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'Nubank Investments'}), (a:Asset {name: 'Treasury Selic'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'Coinbase'}), (a:Asset {name: 'Ethereum'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'Inter Investments'}), (a:Asset {name: 'ABEV3'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'Inter Investments'}), (a:Asset {name: 'SHFI11'})
CREATE (b)-[:OFFERS]->(a);

MATCH (b:Broker {name: 'XP Investments'}), (a:Asset {name: 'CDB High Yield'})
CREATE (b)-[:OFFERS]->(a);

// Create investor profiles (Profile)
CREATE (:Profile {name: 'Aggressive'}),
       (:Profile {name: 'Moderate'}),
       (:Profile {name: 'Conservative'});

// Assign profiles to investors (HAS_PROFILE)
MATCH (p:Person {name: 'Alice'}), (pr:Profile {name: 'Aggressive'})
CREATE (p)-[:HAS_PROFILE]->(pr);

MATCH (p:Person {name: 'Bob'}), (pr:Profile {name: 'Moderate'})
CREATE (p)-[:HAS_PROFILE]->(pr);

MATCH (p:Person {name: 'Charlie'}), (pr:Profile {name: 'Conservative'})
CREATE (p)-[:HAS_PROFILE]->(pr);

MATCH (p:Person {name: 'Diana'}), (pr:Profile {name: 'Aggressive'})
CREATE (p)-[:HAS_PROFILE]->(pr);

MATCH (p:Person {name: 'Eve'}), (pr:Profile {name: 'Conservative'})
CREATE (p)-[:HAS_PROFILE]->(pr);

// Link investors to assets they invested in (INVESTED_IN)
MATCH (p:Person {name: 'Alice'}), (a:Asset {name: 'Bitcoin'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Alice'}), (a:Asset {name: 'PETR4'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Bob'}), (a:Asset {name: 'HGLG11'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Charlie'}), (a:Asset {name: 'Treasury Selic'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Diana'}), (a:Asset {name: 'Ethereum'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Eve'}), (a:Asset {name: 'CDB High Yield'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Alice'}), (a:Asset {name: 'ABEV3'})
CREATE (p)-[:INVESTED_IN]->(a);

MATCH (p:Person {name: 'Bob'}), (a:Asset {name: 'SHFI11'})
CREATE (p)-[:INVESTED_IN]->(a);

// Link investors to their favorite assets (FAVORITES)
MATCH (p:Person {name: 'Charlie'}), (a:Asset {name: 'Bitcoin'})
CREATE (p)-[:FAVORITES]->(a);

MATCH (p:Person {name: 'Charlie'}), (a:Asset {name: 'CDB High Yield'})
CREATE (p)-[:FAVORITES]->(a);

MATCH (p:Person {name: 'Diana'}), (a:Asset {name: 'Bitcoin'})
CREATE (p)-[:FAVORITES]->(a);

MATCH (p:Person {name: 'Eve'}), (a:Asset {name: 'Treasury Selic'})
CREATE (p)-[:FAVORITES]->(a);

MATCH (p:Person {name: 'Alice'}), (a:Asset {name: 'Ethereum'})
CREATE (p)-[:FAVORITES]->(a);

// Link investors to brokers they use (USES)
MATCH (p:Person {name: 'Alice'}), (b:Broker {name: 'XP Investments'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Alice'}), (b:Broker {name: 'Binance'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Bob'}), (b:Broker {name: 'XP Investments'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Charlie'}), (b:Broker {name: 'Nubank Investments'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Diana'}), (b:Broker {name: 'Coinbase'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Eve'}), (b:Broker {name: 'Nubank Investments'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Bob'}), (b:Broker {name: 'Inter Investments'})
CREATE (p)-[:USES]->(b);

MATCH (p:Person {name: 'Alice'}), (b:Broker {name: 'Inter Investments'})
CREATE (p)-[:USES]->(b);
