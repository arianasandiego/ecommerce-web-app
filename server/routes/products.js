import express from 'express';
import pool from '../db.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT
                products.id,
                products.name,
                products.description,
                products.price,
                products.stock,
                products.category_id,
                categories.name AS category
            FROM products
            JOIN categories
                ON products.category_id = categories.id
            ORDER BY products.id
        `);

        res.json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch products' });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const result = await pool.query(`
            SELECT
                products.id,
                products.name,
                products.description,
                products.price,
                products.stock,
                products.category_id,
                categories.name AS category
            FROM products
            JOIN categories
                ON products.category_id = categories.id
            WHERE products.id = $1
        `, [req.params.id]);

        if (result.rows.length === 0) {
            return res.status(404).json({ error: 'Product not found' });
        }

        res.json(result.rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Failed to fetch product' });
    }
});

export default router;