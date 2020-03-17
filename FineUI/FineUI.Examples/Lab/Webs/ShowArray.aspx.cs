using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FineUI.Examples.Lab.Controllers;

namespace WebSharp
{
    public partial class ShowArray : System.Web.UI.Page
    {
        /// 选择的数据结构模式
        private static StructType _mode;
        /// 结构展示对象
        private static StructShowController<string> _structShowController;
        /// 输出信息
        private static StringBuilder _stringBuilder;

        #region UI控制器

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                _mode = StructType.NormalArray;
                _structShowController = new StructShowController<string>(_mode);
                _stringBuilder = new StringBuilder();
                UpdateInfo(_mode.ToString() + "已创建！");
            }
            ShowPanel();
        }

        /// <summary>
        /// 更新信息栏
        /// </summary>
        /// <param name="message">新增消息</param>
        private void UpdateInfo(string message)
        {
            _stringBuilder.Append(message + "<br/>");
            Info.Text = _stringBuilder.ToString();
           
        }

        /// <summary>
        /// 更新界面
        /// </summary>
        private void ShowPanel()
        {
            switch (_mode)
            {
                case StructType.NormalArray:
                case StructType.Array:
                case StructType.ArrayList:
                case StructType.List:
                    // 数组与列表的操作面板
                    AddElement.Hidden = false;
                    AddButton.Hidden = false;
                    AddKey.Hidden = true;
                    AddValue.Hidden = true;
                    AddKeyValueButton.Hidden = true;
                    RemoveKey.Hidden = true;
                    RemoveKeyButton.Hidden = true;
                    break;
                case StructType.Dictionary:
                case StructType.HashTable:
                    // 键值对集合的操作面板
                    AddElement.Hidden = true;
                    AddButton.Hidden = true;
                    AddKey.Hidden = false;
                    AddValue.Hidden = false;
                    AddKeyValueButton.Hidden = false;
                    RemoveKey.Hidden = false;
                    RemoveKeyButton.Hidden = false;
                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }

        #endregion

        #region 添加操作

        /// <summary>
        /// 添加元素
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddButton_Click(object sender, EventArgs e)
        {
            try
            {
                switch (_mode)
                {
                    case StructType.NormalArray:
                    case StructType.Array:
                    case StructType.ArrayList:
                    case StructType.List:
                        // 添加数组、列表的情形
                        _structShowController.Add(AddElement.Text);
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
                UpdateInfo(AddElement.Text + "已加入"+_mode.ToString()+"！");
            }
            catch (Exception exception)
            {
                UpdateInfo(exception.Message);
            }

        }

        /// <summary>
        /// 添加键值对
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddKeyValueButton_Click(object sender, EventArgs e)
        {
            try
            {
                switch (_mode)
                {
                    case StructType.Dictionary:
                    case StructType.HashTable:
                        _structShowController.Add(AddKey.Text, AddValue.Text);
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
                UpdateInfo("["+AddKey.Text +":"+AddValue.Text+"]"+ "已加入" + _mode.ToString() + "！");

            }
            catch (Exception exception)
            {
                UpdateInfo(exception.Message);
            }
        }

        #endregion

        #region 删除操作

        protected void RemoveElementButton_Click(object sender, EventArgs e)
        {
            try
            {
                switch (_mode)
                {
                    case StructType.NormalArray:
                    case StructType.Array:
                    case StructType.ArrayList:
                    case StructType.List:
                        _structShowController.Remove(RemoveElement.Text);
                        break;
                    case StructType.Dictionary:
                    case StructType.HashTable:
                        _structShowController.Remove(RemoveElement.Text);
                        break;

                    default:
                        throw new ArgumentOutOfRangeException();

                }
                UpdateInfo(RemoveElement.Text + "已删除出" + _mode.ToString() + "！");
            }
            catch (Exception exception)
            {
                UpdateInfo(exception.Message);
            }
        }

        protected void RemoveKeyButton_Click(object sender, EventArgs e)
        {
            try
            {
                switch (_mode)
                {
                    case StructType.Dictionary:
                    case StructType.HashTable:
                        _structShowController.RemoveKey(RemoveKey.Text);
                        break;

                    default:
                        throw new ArgumentOutOfRangeException();

                }
                UpdateInfo("键"+RemoveKey.Text + "已删除出" + _mode.ToString() + "！");
            }
            catch (Exception exception)
            {
                UpdateInfo(exception.Message);
            }

        }

        #endregion

        #region 排序

        /// <summary>
        /// 顺序排序
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SequenceSort_Click(object sender, EventArgs e)
        {
            try
            {
                UpdateInfo("顺序：");
                switch (_mode)
                {
                    case StructType.NormalArray:
                    case StructType.Array:
                    case StructType.ArrayList:
                    case StructType.List:
                        _structShowController.SequenceSort();
                        PrintInfo();
                        break;
                    case StructType.Dictionary:
                    case StructType.HashTable:
                        // 键值对按照键进行排列
                        _structShowController.SequenceSortKey();
                        PrintInfo();
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            }
            catch (Exception exception)
            {
                UpdateInfo(exception.Message);
                throw;
            }
        }

        /// <summary>
        /// 逆序排序
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ReverseSort_Click(object sender, EventArgs e)
        {
            try
            {
                UpdateInfo("逆序：");
                switch (_mode)
                {
                    case StructType.NormalArray:
                    case StructType.Array:
                    case StructType.ArrayList:
                    case StructType.List:
                        _structShowController.ReverseSort();
                        PrintInfo();
                        break;
                    case StructType.Dictionary:
                    case StructType.HashTable:
                        // 键值对按照键进行排序
                        _structShowController.ReverseSortKey();
                        PrintInfo();
                        break;
                    default:
                        throw new ArgumentOutOfRangeException();
                }
            }
            catch (Exception exception)
            {
                UpdateInfo(exception.Message);
                throw;
            }

        }


        #endregion

        #region 结构输出

        /// <summary>
        /// 打印当前结构
        /// </summary>
        private void PrintInfo()
        {
            switch (_mode)
            {
                case StructType.NormalArray:
                    for (var i = 0; i < _structShowController.NormalArray.Length; i++)
                    {
                        var item = _structShowController.NormalArray[i];
                        UpdateInfo("[" + i + "]" + item);
                    }

                    break;
                case StructType.Array:
                    for (var i = 0; i < _structShowController.ArrayInstance.Length; i++)
                    {
                        var item = _structShowController.ArrayInstance.GetValue(i);
                        UpdateInfo("[" + i + "]" + item);
                    }

                    break;
                case StructType.ArrayList:
                    int k = 0;
                    foreach (var item in _structShowController.ArrayListInstance)
                    {
                        UpdateInfo("[" + k + "]" + item);
                        k++;
                    }

                    break;
                case StructType.List:
                    int o = 0;
                    foreach (var item in _structShowController.ListInstance)
                    {
                        UpdateInfo("[" + o + "]" + item);
                        o++;
                    }

                    break;
                case StructType.Dictionary:
                    int p = 0;
                    foreach (var item in _structShowController.DictionaryInstance)
                    {
                        UpdateInfo("[" + p + "]" +item.Key+":"+ item.Value);
                        p++;
                    }

                    break;
                case StructType.HashTable:
                    int q = 0;
                    ICollection keys= _structShowController.HashTableInstance.Keys;
                    foreach (var key in keys)
                    {
                        UpdateInfo("[" +q+ "]"  +(string)key + ":" + (string)_structShowController.HashTableInstance[key] );
                        q++;
                    }

                    break;
                default:
                    throw new ArgumentOutOfRangeException();
            }
        }
        
        #endregion

        #region 结构选择

        protected void NormalArray_Click(object sender, EventArgs e)
        {
            _mode = StructType.NormalArray;
            _structShowController = new StructShowController<string>(_mode);
            _stringBuilder.Clear();
            UpdateInfo(_mode.ToString() + "已创建！");
            ShowPanel();

        }

        protected void Array_Click(object sender, EventArgs e)
        {
            _mode = StructType.Array;
            _structShowController = new StructShowController<string>(_mode);
            _stringBuilder.Clear();
            UpdateInfo(_mode.ToString() + "已创建！");
            ShowPanel();



        }

        protected void ArrayList_Click(object sender, EventArgs e)
        {
            _mode = StructType.ArrayList;
            _structShowController = new StructShowController<string>(_mode);
            _stringBuilder.Clear();
            UpdateInfo(_mode.ToString() + "已创建！");
            ShowPanel();



        }

        protected void List_Click(object sender, EventArgs e)
        {
            _mode = StructType.List;
            _structShowController = new StructShowController<string>(_mode);
            _stringBuilder.Clear();
            UpdateInfo(_mode.ToString() + "已创建！");
            ShowPanel();


        }

        protected void Dictionary_Click(object sender, EventArgs e)
        {
            _mode = StructType.Dictionary;
            _structShowController = new StructShowController<string>(_mode);
            _stringBuilder.Clear();
            UpdateInfo(_mode.ToString() + "已创建！");
            ShowPanel();


        }

        protected void HashTable_Click(object sender, EventArgs e)
        {
            _mode = StructType.HashTable;
            _structShowController = new StructShowController<string>(_mode);
            _stringBuilder.Clear();
            UpdateInfo(_mode.ToString() + "已创建！");
            ShowPanel();

        }


        #endregion

    }
}