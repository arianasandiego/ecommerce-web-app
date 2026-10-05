<script>
  import { onMount } from "svelte";

  /** @type {Array<{id: number, name: string, description: string, price: number, stock: number, category: string}>} */
  let products = $state([]);
  let loading = $state(true);
  let error = $state("");

  onMount(async () => {
    try {
      const response = await fetch("http://localhost:3000/products");

      if (!response.ok) {
        throw new Error("Failed to fetch products");
      }

      products = await response.json();
    } catch (err) {
      error = err instanceof Error ? err.message : "Something went wrong";
    } finally {
      loading = false;
    }
  });
</script>

<h1>My E-Commerce Store</h1>

{#if loading}
  <p>Loading products...</p>
{:else if error}
  <p>Error: {error}</p>
{:else}
  {#each products as product}
    <div>
      <h2>{product.name}</h2>
      <p>{product.description}</p>
      <p>€{product.price}</p>
      <p>Category: {product.category}</p>
      <p>Stock: {product.stock}</p>
    </div>
  {/each}
{/if}
