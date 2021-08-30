﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Recipes.Domain
{
    public class UseCaseLog
    {
        public int Id { get; set; }
        public DateTime CreatedAt { get; set; }
        public string UseCaseName { get; set; }
        public string Data { get; set; }
        public string Actor { get; set; }
    }
}
