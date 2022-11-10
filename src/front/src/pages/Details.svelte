<script>
    import { router } from "tinro";
    export let meta;

    const { q = "" } = $meta.query;

    console.log(">", q);
</script>

<main class="m-2 p-2">
    <div>
        <button on:click={() => router.goto("/")}>Back to root</button>
    </div>
    <div>
        Current directory - {q}
    </div>
</main>
