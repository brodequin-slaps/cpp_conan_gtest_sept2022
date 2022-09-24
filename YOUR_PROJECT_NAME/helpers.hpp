#pragma once

#include <iostream>
#include <tuple>
#include <memory>
#include <cstring>

//gereral stuff

template<typename Fn, typename... Args>
void foreach_tuple(Fn&& fn, std::tuple<Args...>& tup)
{
	std::apply([fn = std::forward<Fn>(fn)](auto&... elem)
	{
		(fn(elem), ...);
	}, tup);
}

template<typename Fn, typename... Args>
void foreach_tuple(Fn&& fn, std::tuple<Args...> const& tup)
{
	std::apply([fn = std::forward<Fn>(fn)](auto const&... elem)
	{
		(fn(elem), ...);
	}, tup);
}