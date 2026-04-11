export const fetcher = ([url, token]) =>
    fetch(url, {
      headers: {
        Authorization: `Token ${token}`,
      },
    }).then((res) => {
      if (!res.ok) throw new Error(`Request failed: ${res.status}`)
      return res.json()
    })

