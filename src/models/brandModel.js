// const db = require('../configs/db');

// //list brand
// async function getAllBrand(){
//     const [rows] = await db.query('SELECT * FROM brands');
//     return rows;
// }


// //get infor brand
// async function getBrand(brand_name){
//     try {
//         const [rows] = await db.execute('SELECT * FROM brands WHERE brand_name	= ? ', [brand_name]);
//         return rows[0] || null;
//     } catch (error) {
//         throw error;
//     }
// }

// // Add brand

// async function addBrand(brand) {
//     const {brand_name , brand_description} = brand;
//     try {
//         const result = await db.execute('INSERT INTO brands (brand_name, brand_description) VALUES (?, ?)', [brand_name, brand_description]);
//         return result;
//     } catch (error) {
//         throw error;
//     }
// }


// //Update brand
// async function updateBrand(brand_id, brand_name, brand_description){
//     try {
//         const result = await db.execute('UPDATE brands SET  brand_name = ?, brand_description = ? WHERE brand_id = ?', [brand_name, brand_description, brand_id]);
//         return result;   
//     } catch (error) {
//         throw error;
//     }
// }

// //Delete brand
// async function removeBrand(brand){
//     try{
//         await db.execute('DELETE FROM brands WHERE brand_name = ?', [brand]);
//     }catch(e){
//         throw e;
//     }
// }


// module.exports = {getAllBrand, getBrand, addBrand, updateBrand, removeBrand};

const DataTypes = require('sequelize');
const sequelize = require('../configs/db');

const brand = sequelize.define('brand', {
  brand_id: {
    type: DataTypes.INTEGER,
    primaryKey: true,   
    autoIncrement: true, 
  },
  brand_name: {
    type: DataTypes.STRING,
    allowNull: false,
  },
  brand_description: {
    type: DataTypes.STRING,
    allowNull: true,
  },
}, {
  tableName: 'brands', 
  timestamps: false,    
  primaryKey: 'brand_id', 
});


module.exports = brand;

