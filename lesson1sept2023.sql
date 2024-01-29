use bolbochan;
show tables ;
select * from cars;
# drop table ___;
create table uusers(
                       id int auto_increment primary key,
                       name varchar(20) not null ,
                       age int not null
);
insert into uusers values (null, 'bax', 18);
select * from uusers;
select * from users;
select * from cars;

select id, gender from users;
select id, name, gender from users;
select * from users where name='oleg';
select * from users where age=30 and gender='male';
select * from users where age=30 or gender='male';
# знайти всі машини старші за 2000 р.
select * from cars where year < 2000;
# знайти всі машини молодші 2015 р.
select * from cars where year > 2015;
# знайти всі машини 2008, 2009, 2010, 2011 років
select * from cars where year between 2008 and 2011;
# знайти всі машини 2008, 2009, 2010 років
select * from cars where year>=2008 and year<=2010;
# знайти всі машини НЕ з цих років 2008, 2009, 2010, 2011
select * from cars where year not between 2008 and 2011;

# знайти всі машини не з цих років 2008, 2009, 2010
select * from cars where year>=2008 and year<=2010;
# знайти всі машини де year==price
select * from cars where year=price;

# знайти по першій літері в слові
select *from users where name like 'o%';
# знайти по будь якій літері в слові
select *from users where name like '%o%';

# знайти марку машини в назві яких друга та передостання буква "a"
select * from cars where model like '_a%a_';
# знайти всі машини bmw старші за 2011 р.
select *from cars where model='bmw' and year<2011;
# знайти всі машини audi молодші 2010 р.
select *from cars where model='audi' and year>2010;

select * from users where age=30;
select * from users where age!=30;

# входження в перелік, список чи набір якихось умов
select * from users where age in (20,45,16,25,19);

# сортування за кількісттю символів
select * from users where length(name)=4;
# знайти всі машини назва моделі яких більше за 8 символів
select * from cars where length(model)>=8;

# сортування за
select *from users order by age;
# зростанням
select *from users order by age asc ;
# спаданням тобто в зворотньому від попередньго напрямку
select *from users order by age desc ;

# компонування двох принципів сортування
select * from users where age>20 order by age desc;

# ліміти та офсети
select * from users where age>20 order by age desc limit 3;
select * from users where age>20 order by age desc limit 3 offset 3;

# знайти перші 5 машин
select *from cars limit 5;
select *from cars order by id asc limit 5;

# знайти останні 5 машин
select *from cars order by id desc limit 5;
# за назвою
select *from cars order by model desc limit 5;

# агрегатні функції:
# min()
select min(age) from users;
select min(age) as minAge from users;
# max()
select max(age) as maxAge from users;
# sum()
select sum(age) as sumAge from users;
# avg()
select avg(age) as avgAge from users;

# знайти середнє арифметичне цін машини KIA
select avg(price) as avgPriceCar from cars where model='KIA';
# знайти середнє арифметичне цін для кожної марки машин окремо
select avg(price) as avgPric, model from cars group by id;

# можна групувати за декількома умовами одночасно через кому
select min(age) as minAge, avg(age) as avgAge, gender from users group by gender;
# count()
select count(*) as count, gender from users group by gender;
# підрахувати кількість кожної марки
select count(*) as countCar, model from cars group by model;

# знайти марку машин кількість яких найбільше
select count(*) as modelCount, model from cars where year>2020 group by model order by modelCount desc limit 1;


select count(*) as modelCount, model from cars group by model;
select count(*) as modelCount, model from cars where year>2020 group by model order by modelCount;
select count(*) as modelCount, model from cars where year>2020 group by model order by modelCount desc ;
select count(*) as modelCount, model from cars where year>2020 group by model having modelCount>=2 order by modelCount;
# ***знайти машини ціна котрих більше ніж ціна середнього
# арифметичного всіх машин
# select * from cars where price > (selest avg(price) from cars);
select * from cars where price>(select avg(price)from cars);
# видалення з таблиці за певних заданих умов
# delete from users where id=9;
# delete from users where id=9 limit 3;

# апдейт окремих елементів таблиці за заданих умов
update users set gender='male' where name='lina';

select * from users;




