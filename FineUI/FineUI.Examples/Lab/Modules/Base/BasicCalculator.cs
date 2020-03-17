using System;
using System.Collections.Generic;

namespace FineUI.Examples.Lab.Modules.Base
{

/************************************************************************/
/*                          计算器处理                                    */
/************************************************************************/


    #region 计算器处理

    /// <summary>
    /// 计算报错类
    /// </summary>
    public class BasicCalculatorException : ApplicationException
    {
        public BasicCalculatorException(string message) : base(message)
        {
        }
    }

    /// <summary>
    /// 计算器类
    /// </summary>
    public class BasicCalculator
    {

        /// <summary>
        /// 对浮点数的整数检查
        /// </summary>
        /// <param name="num">目标浮点数</param>
        /// <returns></returns>
        private static bool CheckInt(float num)
        {
            if (Math.Abs((int)num - num) > 0.00001)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        /// <summary>
        /// 加法运算
        /// </summary>
        /// <param name="num0">加数1</param>
        /// <param name="num1">加数0</param>
        /// <returns>和</returns>
        protected static float Plus(float num0, float num1) => num0 + num1;

        /// <summary>
        /// 减法运算
        /// </summary>
        /// <param name="num0"></param>
        /// <param name="num1"></param>
        /// <returns></returns>
        protected static float Minus(float num0, float num1) => num0 - num1;

        /// <summary>
        /// 乘法运算
        /// </summary>
        /// <param name="num0"></param>
        /// <param name="num1"></param>
        /// <returns></returns>
        protected static float Multiply(float num0, float num1) => num0 * num1;

        /// <summary>
        /// 除法运算
        /// </summary>
        /// <param name="num0">除数</param>
        /// <param name="num1">被除数</param>
        /// <returns></returns>
        protected static float Divide(float num0, float num1)
        {
            float result;
            if (Math.Abs(num1) > 0.0001)
            {
                result = num0 / num1;
            }
            else
            {
                BasicCalculatorException e = new BasicCalculatorException("除数为0。");
                throw e;
            }

            return result;
        }

        /// <summary>
        /// 幂运算
        /// </summary>
        /// <param name="num0">底数</param>
        /// <param name="num1">指数</param>
        /// <returns></returns>
        protected static float Pow(float num0, float num1)
        {
            float result = (float)Math.Pow(num0, num1);
            if (double.IsNaN(result))
            {
                BasicCalculatorException e = new BasicCalculatorException("存在无法计算的乘方数。");
                throw e;
            }
            return result;
        }

        /// <summary>
        /// 整除
        /// </summary>
        /// <param name="num0">被除数</param>
        /// <param name="num1">除数</param>
        /// <returns></returns>
        protected static float ExactDivide(float num0, float num1)
        {
            if (CheckInt(num0) && CheckInt(num1))
            {
                return ((int)num0 / (int)num1);
            }
            else
            {
                BasicCalculatorException e = new BasicCalculatorException("整除应输入整数。");
                throw e;
            }
        }

        /// <summary>
        /// 整除取余
        /// </summary>
        /// <param name="num0"></param>
        /// <param name="num1"></param>
        /// <returns></returns>
        protected static float Remain(float num0, float num1)
        {
            if (CheckInt(num0) && CheckInt(num1))
            {
                return ((int)num0 % (int)num1);
            }
            else
            {
                BasicCalculatorException e = new BasicCalculatorException("取余应输入整数。");
                throw e;
            }
        }
        
        /// <summary>
        /// 开方计算
        /// </summary>
        /// <param name="num0"></param>
        /// <param name="num1"></param>
        /// <returns></returns>
        protected static float Root(float num0, float num1)
        {
            float result = (float)Math.Pow(num0, 1 / num1);
            if (double.IsNaN(result))
            {
                BasicCalculatorException e = new BasicCalculatorException("存在无法计算的开方数。");
                throw e;
            }
            return result;
        }

    }

    #endregion

/************************************************************************/
/*                          方程处理                                      */
/************************************************************************/

    #region 方程处理

    /// <summary>
    /// 解方程接口
    /// </summary>
    interface IEquation
    {
        List<float> GetRoot();
    }


    /// <summary>
    /// 方程类
    /// </summary>
    public class Equation : BasicCalculator
    {

        /// 方程次数
        public readonly int Degree;
        /// 方程结果
        public List<float> Result { get; protected set;} = new List<float>();
        /// 方程表达式
        public string EquautionString { get; protected set; }

        public Equation(int degree,params float[] fictions)
        {
            Degree = degree;
        }

        /// <summary>
        /// 解方程运算，需要IEquation接口
        /// </summary>
        /// <returns></returns>
        public int Solve()
        {
            if (this is IEquation solver)
            {
                this.Result = solver.GetRoot();
                return this.Result.Count;
            }

            return 0;
        }
    }

    /// <summary>
    /// 二次方程类
    /// </summary>
    class TwoDegreeEquation : Equation,IEquation
    {
        /// 零次系数
        public float FictionA { get;  }
        /// 一次系数
        public float FictionB { get;  }
        /// 二次系数
        public float FictionC { get;  }


        public TwoDegreeEquation(params float[] fictions) : base(2, fictions)
        {
            FictionA = fictions[0];
            FictionB = fictions[1];
            FictionC = fictions[2];
            EquautionString = FictionC + "x²"+ (FictionB<0?"":"+") + FictionB + "x" + (FictionA < 0 ? "" : "+") + FictionA + "=0";  
            this.Solve();
        }

        public List<float> GetRoot()
        {
            //判别式
            float delta = FictionB * FictionB - 4 * FictionA * FictionC;
            //判别式小于零，无解
            if (delta < 0)
            {
                BasicCalculatorException e = new BasicCalculatorException("二次方程无解！");
                throw e;
            }
            this.Result.Add(((-FictionB) + (float)Math.Sqrt(delta)) / (2 * FictionC));
            //判别式大于零，两个解
            if (delta > 0)
            {
                this.Result.Add(((-FictionB) - (float)Math.Sqrt(delta)) / (2 * FictionC));
            }

            return Result;
        }
    }

    /// <summary>
    /// 一次方程类
    /// </summary>
    class OneDegreeEquation : Equation,IEquation
    {
        /// 零次系数
        private float FictionA { get; set; }
        /// 一次系数
        private float FictionB { get; set; }

        public OneDegreeEquation(params float[] fictions) : base(1, fictions)
        {
            FictionA = fictions[0];
            FictionB = fictions[1];
            EquautionString = FictionB + "x" + (FictionA < 0 ? "" : "+") + FictionA + "=0";

            this.Solve();
        }

        public List<float> GetRoot()
        {
            this.Result.Add((-FictionA) / FictionB); 
            return Result;
        }

    }

    #endregion
}