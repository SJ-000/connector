<script>
    import { router } from "tinro";

    // Catch the given query from Home
    export let meta;
    const { k = "", v = "" } = $meta.query;
    console.log(v);

    import { values } from "../lib/store.js";
    console.log(">", $values);
</script>

<main class="m-2 p-2">
    <div class="space-x-0">
        <button on:click={() => router.goto("/")}>Back to root</button>
        <button on:click={() => console.log("Run for this dir")}
            >Run for this directory</button
        >
    </div>

    <div class="m-2 p-2">
        Current - {k}
    </div>

    <div class="mx-8 p-2">
        <ul class="list-disc">
            {#each $values as v}
                <li>
                    <p>{v.posn}</p>
                    <p>{v.msg}</p>
                </li>
            {/each}
        </ul>
    </div>
</main>
