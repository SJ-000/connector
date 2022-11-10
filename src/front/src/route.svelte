<script>
    import { Route } from "tinro";
    import Home from "./pages/Home.svelte";
    import Details from "./pages/Details.svelte";
</script>

<div>
    <Route path="/"><Home /></Route>
    <Route path="/details" let:meta><Details {meta} /></Route>
</div>
