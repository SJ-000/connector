<script>
    import { router } from "tinro";
    import { getValuesPerName, names } from "../lib/store.js";
</script>

<main class="m-2 p-2">
    <div class="flex space-x-4">
        <h1 class="text-3xl font-bold">Root</h1>
        <button on:click={() => console.log("run for all")}>
            Run for all
        </button>
    </div>

    <div class="ml-4 mt-1">
        <ul class="list-disc">
            {#each $names as item}
                <li>
                    <p>
                        {item.name}
                        ({item.amount})
                        <button
                            on:click={(e) => {
                                console.log(item.name);
                                const name = item.name.toString();
                                getValuesPerName(name);
                                router.goto("/details/?k=".concat(name));
                            }}>Open</button
                        >
                    </p>
                </li>
            {/each}
        </ul>
    </div>
</main>
