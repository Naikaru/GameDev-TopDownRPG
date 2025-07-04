{
  "$GMObject":"",
  "%Name":"oEnemy",
  "eventList":[
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":0,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":null,"eventNum":0,"eventType":3,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
    {"$GMEvent":"v1","%Name":"","collisionObjectId":{"name":"oPlayer","path":"objects/oPlayer/oPlayer.yy",},"eventNum":0,"eventType":4,"isDnD":false,"name":"","resourceType":"GMEvent","resourceVersion":"2.0",},
  ],
  "managed":true,
  "name":"oEnemy",
  "overriddenProperties":[
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"pActor","path":"objects/pActor/pActor.yy",},"propertyId":{"name":"maxHp","path":"objects/pActor/pActor.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"3",},
    {"$GMOverriddenProperty":"v1","%Name":"","name":"","objectId":{"name":"pActor","path":"objects/pActor/pActor.yy",},"propertyId":{"name":"showHealthBar","path":"objects/pActor/pActor.yy",},"resourceType":"GMOverriddenProperty","resourceVersion":"2.0","value":"True",},
  ],
  "parent":{
    "name":"Enemies",
    "path":"folders/Objects/Entities/Enemies.yy",
  },
  "parentObjectId":{
    "name":"pActor",
    "path":"objects/pActor/pActor.yy",
  },
  "persistent":false,
  "physicsAngularDamping":0.1,
  "physicsDensity":0.5,
  "physicsFriction":0.2,
  "physicsGroup":1,
  "physicsKinematic":false,
  "physicsLinearDamping":0.1,
  "physicsObject":false,
  "physicsRestitution":0.1,
  "physicsSensor":false,
  "physicsShape":1,
  "physicsShapePoints":[],
  "physicsStartAwake":true,
  "properties":[
    {"$GMObjectProperty":"v1","%Name":"damage","filters":[],"listItems":[],"multiselect":false,"name":"damage","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"1","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"knockbackForce","filters":[],"listItems":[],"multiselect":false,"name":"knockbackForce","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"16","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemySpeed","filters":[],"listItems":[],"multiselect":false,"name":"enemySpeed","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"0.6","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyWanderDistance","filters":[],"listItems":[],"multiselect":false,"name":"enemyWanderDistance","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"48","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyAggroRadius","filters":[],"listItems":[],"multiselect":false,"name":"enemyAggroRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"64","varType":0,},
    {"$GMObjectProperty":"v1","%Name":"enemyAttackRadius","filters":[],"listItems":[],"multiselect":false,"name":"enemyAttackRadius","rangeEnabled":false,"rangeMax":10.0,"rangeMin":0.0,"resourceType":"GMObjectProperty","resourceVersion":"2.0","value":"32","varType":0,},
  ],
  "resourceType":"GMObject",
  "resourceVersion":"2.0",
  "solid":false,
  "spriteId":{
    "name":"sEnemy",
    "path":"sprites/sEnemy/sEnemy.yy",
  },
  "spriteMaskId":{
    "name":"sEnemy",
    "path":"sprites/sEnemy/sEnemy.yy",
  },
  "visible":true,
}