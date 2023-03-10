package users_test

import (
	"testing"

	"github.com/arwos/artifactory/internal/storages/users"
	"github.com/deweppro/go-sdk/random"
	"github.com/stretchr/testify/require"
)

func TestUnit_NewCache(t *testing.T) {
	c := users.NewCache(10)
	u, ok := c.Get("u")
	require.False(t, ok)
	require.Equal(t, users.User{}, u)

	nu := users.User{
		ID:       0,
		Login:    "u",
		Passwd:   nil,
		TempKey:  nil,
		TempHash: random.Bytes(2),
		Groups:   nil,
	}
	c.Set(nu)

	u, ok = c.Get("u")
	require.True(t, ok)
	require.Equal(t, nu, u)

	nu.ID = 1
	require.NotEqual(t, nu, u)
	c.Set(nu)

	u, ok = c.Get("u")
	require.True(t, ok)
	require.Equal(t, nu, u)
}
