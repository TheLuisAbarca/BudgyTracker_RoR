# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
user1 = User.create!(name:'Luis Abarca', email:'angelgrd12@gmail.com', password:'123456', password_confirmation:'123456');
user2 = User.create!(name:'Tyler Avla', email:'arclaav.adm@gmail.com', password:'456789', password_confirmation:'456789');

group1 = Group.create!(name:'Group 1', icon: 'https://www.shareicon.net/data/128x128//2017/07/13/888377_document_512x512.png');
group2 = Group.create!(name:'Group 2', icon: 'https://www.shareicon.net/data/128x128//2017/07/13/888382_share_512x512.png');
group3 = Group.create!(name:'Group 3', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888383_time_512x512.png');
group4 = Group.create!(name:'Group 4', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888371_aim_512x512.png');
group5 = Group.create!(name:'Group 5', icon: 'https://www.shareicon.net/man-business-work-officer-businessman-888372');
group6 = Group.create!(name:'Group 6', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888383_time_512x512.png');
group7 = Group.create!(name:'Group 7', icon: 'https://www.shareicon.net/data/128x128/2017/07/13/888381_globe_512x512.png');


entity1 = Entity.create!(name:'Food', amount: 22, author: user1);
entity2 = Entity.create!(name:'Games', amount: 54, author: user1);
entity3 = Entity.create!(name:'MakeUp', amount: 43, author: user1);
entity4 = Entity.create!(name:'Food', amount: 1, author: user2);
entity5 = Entity.create!(name:'Games', amount: 2, author: user2);
entity6 = Entity.create!(name:'MakeUp', amount: 10, author: user2);

GroupsEntity.create!(group_id: group1.id, entity_id: entity1.id);
GroupsEntity.create!(group_id: group1.id, entity_id: entity2.id);
GroupsEntity.create!(group_id: group4.id, entity_id: entity3.id);
GroupsEntity.create!(group_id: group4.id, entity_id: entity4.id);
GroupsEntity.create!(group_id: group5.id, entity_id: entity5.id);
GroupsEntity.create!(group_id: group5.id, entity_id: entity6.id);