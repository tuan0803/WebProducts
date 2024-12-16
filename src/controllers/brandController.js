const brandModel = require('../models/brandModel');

//list

// async function getBrands(req, res){
//     try {
//         const brands = await brandModel.getAllBrand();
//         res.status(200).json(brands)
//     } catch (error) {
//         console.log(error);
//     }
// }

async function getAllBrand(req, res) {
    try {
        const brands = await brandModel.findAll();
        return res.json(brands);
    } catch (error) {
        console.error('Error get list brands', error);
        throw error;
    }
}

// get infor brand
async function getBrand(req, res){
    try {
        const brand_name = req.params.brand_id;
        const brand = await brandModel.findOne({ where: { brand_name } });
        (brand) ? res.json(brand) : res.status(404).json('Not Found');
    } catch (error) {
        throw error;
    }   
}

//create brand
async function addBrand(req, res){
    const newBrand = req.body;
    try {
        await brandModel.create(newBrand);
        res.status(201).json('Created brand new');
    } catch (error) {
        console.error(error);
        throw e;
    }
}


//update brand
async function updateBrand(req, res, next) {
    try {
        const brand_id = req.params.brand_id; 
        const { brand_name, brand_description } = req.body;  

        const [updated] = await brandModel.update(
            { brand_name, brand_description }, 
            { where: { brand_id } }  
        );

        if (updated) {
            res.json({ message: 'Brand updated successfully' });
        } else {
            res.status(404).json('Brand not found');
        }
    } catch (error) {
        next(error); 
    }
}
  


//delete brand
async function removeBrand(req, res){
    const brand_id  = req.params.id;
    try{
        const result = await brandModel.destroy({
            where: { brand_id: brand_id}
        });
        if (result === 0) {
            return res.status(404).json('Brand not found');
        }
        res.status(200).json('Delete successfull');
        return result;
    }catch(e){
        throw e;
    }
}


module.exports = {getAllBrand, getBrand, addBrand, updateBrand, removeBrand}
