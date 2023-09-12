import { writable } from "svelte/store";

function createRouter(): Writable {
  let hash = decodeURI(location.hash);
  if (hash.startsWith('#/')) hash = hash.slice(2);

  const store = writable(hash);

  function subscribe(f) {
    window.addEventListener("hashchange", callback, false);
    const unsubscribe = store.subscribe(f);
    return () => {
      window.removeEventListener("hashchange", callback, false);
      unsubscribe();
    }
  }

  function callback(ev) {
    let hash = decodeURI(location.hash);
    if (hash.startsWith('#/')) {
      hash = hash.slice(2);
      store.set(hash);
    } else {
      store.set(404);
    }
  }

  return {
    subscribe,
  }
}

export const hashRouter = createRouter();
