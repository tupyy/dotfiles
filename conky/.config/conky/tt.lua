#!/usr/bin/lua

myClass = {}

function myClass:func1(x, y)
  -- Do anything
  self.x = self.x + y
  self.y = self.y - x
end

function myClass:new(c)
  local c = c or {}
  self.__index = self
  setmetatable(c, self)
  return c
end

local a = myClass:new{ x = 5, y = 3 }
a:func1(1, 1)
print(a.x)
