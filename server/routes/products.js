import express from 'express';
import pool from '../db.js';

const router = express.Router();

router.get('/', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM products');
        res.json(result.rows);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error fetching products' });
    }
});

router.get('/:id', async (req, res) => {
    try {
        const result = await pool.query(
            'SELECT * FROM products WHERE id = $1',
            [req.params.id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Product not found' });
        }

        res.json(result.rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error fetching product' });
    }
});

router.post('/', async (req, res) => {
    try {
        const { name, description, price, stock } = req.body;

        const result = await pool.query(
            `INSERT INTO products (name, description, price, stock)
             VALUES ($1, $2, $3, $4)
             RETURNING *`,
            [name, description, price, stock]
        );

        res.status(201).json(result.rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error creating product' });
    }
});

router.put('/:id', async (req, res) => {
    try {
        const { name, description, price, stock } = req.body;

        const result = await pool.query(
            `UPDATE products
             SET name = $1, description = $2, price = $3, stock = $4
             WHERE id = $5
             RETURNING *`,
            [name, description, price, stock, req.params.id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Product not found' });
        }

        res.json(result.rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error updating product' });
    }
});

router.delete('/:id', async (req, res) => {
    try {
        const result = await pool.query(
            'DELETE FROM products WHERE id = $1 RETURNING *',
            [req.params.id]
        );

        if (result.rows.length === 0) {
            return res.status(404).json({ message: 'Product not found' });
        }

        res.json({
            message: 'Product deleted successfully',
            product: result.rows[0]
        });
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error deleting product' });
    }
});

export default router;