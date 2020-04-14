﻿using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;

namespace FineUI.Examples.Lab.Controllers
{
    public static class ExtendStruct
    {
    }

    public class StructShowControllerException : ApplicationException
    {
        public StructShowControllerException(string message) : base(message)
        {
        }
    }

    public enum StructType
    {
        NormalArray,
        Array,
        ArrayList,
        List,
        Dictionary,
        HashTable
    }

    public class StructShowController<TItemType> where TItemType : IComparable
    {
        #region 字段与属性

        /// 结构
        public StructType BaseType { get; }

        /// 数组容量
        private readonly int _arrayLength;

        /// 数组中最后一个可用元素的Index
        public int ArrayCount { get; set; }

        #region 结构

        public TItemType[] NormalArray { get; }
        public Array ArrayInstance { get; }
        public ArrayList ArrayListInstance { get; }
        public List<TItemType> ListInstance { get; }
        public Dictionary<string, TItemType> DictionaryInstance { get; private set; }
        public Hashtable HashTableInstance { get; private set; }

        #endregion

        #endregion

        public StructShowController(StructType type, int length = 20)
        {
            BaseType = type;
            _arrayLength = length;
            ArrayCount = -1;
            switch (type)
            {
                case StructType.NormalArray:
                    NormalArray = new TItemType[_arrayLength];
                    break;
                case StructType.Array:
                    ArrayInstance = Array.CreateInstance(typeof(TItemType), _arrayLength);
                    break;
                case StructType.ArrayList:
                    ArrayListInstance = new ArrayList();
                    break;
                case StructType.List:
                    ListInstance = new List<TItemType>();
                    break;
                case StructType.Dictionary:
                    DictionaryInstance = new Dictionary<string, TItemType>();
                    break;
                case StructType.HashTable:
                    HashTableInstance = new Hashtable();
                    break;
                default:
                    throw new ArgumentOutOfRangeException(nameof(type), type, null);
            }
        }

        #region 添加

        /// <summary>
        ///     数组集合结构的添加
        /// </summary>
        /// <param name="item"></param>
        /// <returns></returns>
        public void Add(TItemType item)
        {
            switch (BaseType)
            {
                case StructType.NormalArray:
                    NormalArray[++ArrayCount] = item;
                    break;
                case StructType.Array:
                    ArrayInstance.SetValue(item, ++ArrayCount);
                    break;
                case StructType.ArrayList:
                    ArrayListInstance.Add(item);
                    break;
                case StructType.List:
                    ListInstance.Add(item);
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }


        /// <summary>
        ///     键值对的添加
        /// </summary>
        /// <param name="key">键</param>
        /// <param name="item">值</param>
        /// <returns></returns>
        public void Add(string key, TItemType item)
        {
            switch (BaseType)
            {
                case StructType.Dictionary:
                    DictionaryInstance.Add(key, item);
                    break;
                case StructType.HashTable:
                    HashTableInstance.Add(key, item);
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        #endregion

        #region 删除

        // 删除数组集合元素
        public void Remove(TItemType item)
        {
            try
            {
                switch (BaseType)
                {
                    case StructType.NormalArray:
                        if (Array.IndexOf(NormalArray, item) != -1)
                        {
                            NormalArray[Array.IndexOf(NormalArray, item)] = default(TItemType);
                            // for (var i = Array.IndexOf(NormalArray, item); i < ArrayCount - 1; i++)
                            //     NormalArray[i] = NormalArray[i + 1];
                            ArrayCount--;
                        }
                        else
                        {
                            var e = new StructShowControllerException("找不到元素!");
                            throw e;
                        }

                        break;
                    case StructType.Array:
                        if (Array.IndexOf(ArrayInstance, item) != -1)
                        {
                            ArrayInstance.SetValue(null,Array.IndexOf(ArrayInstance, item));
                            // for (var i = Array.IndexOf(ArrayInstance, item); i < ArrayCount - 1; i++)
                            //     ArrayInstance.SetValue(ArrayInstance.GetValue(i + 1), i);
                            ArrayCount--;
                        }
                        else
                        {
                            var e = new StructShowControllerException("找不到元素!");
                            throw e;
                        }

                        break;
                    case StructType.ArrayList:
                        if (ArrayListInstance.Contains(item))
                        {
                            ArrayListInstance.Remove(item);
                        }
                        else
                        {
                            var e = new StructShowControllerException("找不到元素!");
                            throw e;
                        }

                        break;
                    case StructType.List:
                        if (ListInstance.Contains(item))
                        {
                            ListInstance.Remove(item);
                        }
                        else
                        {
                            var e = new StructShowControllerException("找不到元素!");
                            throw e;
                        }

                        break;
                    case StructType.Dictionary:
                        if (DictionaryInstance.ContainsValue(item))
                        {
                            foreach (var comparable in DictionaryInstance)
                                if (comparable.Value.Equals(item))
                                    DictionaryInstance.Remove(comparable.Key);
                        }
                        else
                        {
                            var e = new StructShowControllerException("找不到元素!");
                            throw e;
                        }

                        break;
                    case StructType.HashTable:
                        if (HashTableInstance.ContainsValue(item))
                        {
                            foreach (DictionaryEntry entry in HashTableInstance)
                                if (entry.Value.Equals(item))
                                    HashTableInstance.Remove(entry.Key);
                        }
                        else
                        {
                            var e = new StructShowControllerException("找不到元素!");
                            throw e;
                        }

                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            }
            catch (InvalidOperationException)
            {
            }
        }

        // 删除键值对元素
        public void RemoveKey(string key)
        {
            switch (BaseType)
            {
                case StructType.Dictionary:
                    if (DictionaryInstance.ContainsKey(key))
                    {
                        DictionaryInstance.Remove(key);
                    }
                    else
                    {
                        var e = new StructShowControllerException("找不到键!");
                        throw e;
                    }

                    break;
                case StructType.HashTable:
                    if (HashTableInstance.ContainsKey(key))
                    {
                        HashTableInstance.Remove(key);
                    }
                    else
                    {
                        var e = new StructShowControllerException("找不到键!");
                        throw e;
                    }

                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        #endregion


        #region 排序

        #region 顺序排序

        /// <summary>
        ///     对数组与列表顺序排序
        /// </summary>
        public void SequenceSort()
        {
            switch (BaseType)
            {
                case StructType.NormalArray:
                    Array.Sort(NormalArray);
                    break;
                case StructType.Array:
                    Array.Sort(ArrayInstance);
                    break;
                case StructType.ArrayList:
                    ArrayListInstance.Sort();
                    break;
                case StructType.List:
                    ListInstance.Sort();
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        /// <summary>
        ///     对键值对的键部分顺序排序
        /// </summary>
        public void SequenceSortKey()
        {
            switch (BaseType)
            {
                case StructType.Dictionary:
                    DictionaryInstance = DictionaryInstance.OrderBy(dict => dict.Key)
                        .ToDictionary(dict => dict.Key, dict => dict.Value);
                    break;
                case StructType.HashTable:
                    var temp = new List<string>();
                    var strings = new string[30];
                    HashTableInstance.Keys.CopyTo(strings, 0);
                    // 转换为列表排序
                    temp = strings.ToList();
                    temp.Sort();
                    var hash = new Hashtable();
                    foreach (var key in temp)
                        if (key != null)
                            hash.Add(key, HashTableInstance[key]);

                    HashTableInstance = hash;
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        #endregion

        #region 逆序排序

        /// <summary>
        ///     对数组列表逆序排序
        /// </summary>
        public void ReverseSort()
        {
            switch (BaseType)
            {
                case StructType.NormalArray:
                    Array.Sort(NormalArray);
                    Array.Reverse(NormalArray);
                    break;
                case StructType.Array:
                    Array.Sort(ArrayInstance);
                    Array.Reverse(ArrayInstance);

                    break;
                case StructType.ArrayList:
                    ArrayListInstance.Sort();
                    ArrayListInstance.Reverse();
                    break;
                case StructType.List:
                    ListInstance.Sort();
                    ListInstance.Reverse();
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        /// <summary>
        ///     对键值对的键部分逆序排序
        /// </summary>
        public void ReverseSortKey()
        {
            switch (BaseType)
            {
                case StructType.Dictionary:
                    DictionaryInstance = DictionaryInstance.OrderByDescending(dict => dict.Key)
                        .ToDictionary(dict => dict.Key, dict => dict.Value);
                    break;
                case StructType.HashTable:
                    var temp = new List<string>();
                    var strings = new string[30];
                    HashTableInstance.Keys.CopyTo(strings, 0);
                    // 转换为列表排序
                    temp = strings.ToList();
                    temp.Sort();
                    var hash = new Hashtable();
                    foreach (var key in temp)
                        if (key != null)
                            hash.Add(key, HashTableInstance[key]);

                    HashTableInstance = hash;
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        #endregion

        #endregion
    }
}