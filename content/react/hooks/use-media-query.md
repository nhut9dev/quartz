---
title: useMediaQuery
description: A custom hook pattern for reading CSS media query matches in React.
tags:
  - react
  - hook
  - browser
---

`useMediaQuery` reads whether a browser media query currently matches.

```jsx
function useMediaQuery(query) {
  const [matches, setMatches] = useState(false)

  useEffect(() => {
    const media = window.matchMedia(query)
    setMatches(media.matches)

    const listener = event => setMatches(event.matches)
    media.addEventListener("change", listener)

    return () => media.removeEventListener("change", listener)
  }, [query])

  return matches
}
```

Prefer CSS for layout whenever possible. Use this hook when JavaScript behavior itself must change based on the viewport or user preference.
