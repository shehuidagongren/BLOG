<template >
    <el-main class="mainPage">
        <div class="leftcard">
            <el-card >
                <h2>用户管理</h2>
            </el-card >

            <el-card>
                 <!-- 添加用户信息 -->
                <el-dialog title="更新用户信息" :visible.sync="isnormal" :modal="false" style="text-align: center">
                    <el-form label-width="150px" class="demo-ruleForm" >
                    <el-form-item label="用户昵称" prop="userName">
                        <el-input v-model="updateTable.userName "></el-input>
                    </el-form-item>
                    <el-form-item label="用户邮箱" prop="userEmail">
                        <el-input v-model="updateTable.userEmail"></el-input>
                    </el-form-item>
                    <el-form-item label="用户密码" prop="userPassword">
                        <el-input v-model="updateTable.userPassword"></el-input>
                    </el-form-item>
                    <el-form-item label="用户类型"  >
                        <el-select v-model="updateTable.userType" placeholder="请选择">
                            <el-option v-for="item in typeTable" :key="item.value" :label="item.label" :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="账号状态"  >
                        <el-select v-model="updateTable.userStatus" placeholder="请选择">
                            <el-option v-for="item in statusTable" :key="item.value" :label="item.label" :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="用户性别" >
                        <el-select v-model="updateTable.userSex" placeholder="请选择">
                            <el-option v-for="item in sexTable" :key="item.value" :label="item.label" :value="item.value">
                            </el-option>
                        </el-select>
                    </el-form-item>
                    <el-form-item label="用户地址" prop="userLocation">
                        <el-input v-model="updateTable.userLocation"></el-input>
                    </el-form-item>
                    <el-form-item label="用户头像" prop="userAvatar">
                        <el-input v-model="updateTable.userAvatar"></el-input>
                    </el-form-item>
                    </el-form>
                    <div slot="footer" class="dialog-footer">
                    <el-button type="success" size="mini"  @click="updateUser('updateTable')">确 定</el-button>
                    <el-button type="primary" size="mini"  @click="cancelUpdate('updateTable')">取 消</el-button>

                    </div>
                </el-dialog>
                <el-table   :data="tableData"
                    stripe border style="width: 100%" height="800px">
                    <el-table-column label="序号" width="50px" align="center" fixed>
                        <template slot-scope="scope">
                            <span>{{ scope.$index + 1 }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="用户昵称" width="150" align="center">
                        <template slot="header"  >
                            <p>用户昵称</p>
                            <el-input  size="mini" placeholder="输入关键字搜索" />
                        </template>
                        <template slot-scope="scope">
                            <el-input v-model="scope.row.userName" v-show="scope.row.true"></el-input>
                            <span v-show="!scope.row.true">{{ scope.row.userName }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="用户邮箱" width="200" align="center">
                        <template slot="header">
                            <p>用户邮箱</p>
                            <el-input  size="mini" placeholder="输入关键字搜索"></el-input>
                        </template>
                          <template slot-scope="scope">
                            <el-input v-model="scope.row.userEmail" v-show="scope.row.true"></el-input>
                            <span v-show="!scope.row.true">{{ scope.row.userEmail }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="用户密码" width="100" align="center">
                        <template slot="header">
                            <p>用户密码</p>
                        </template>
                          <template slot-scope="scope">
                            <span v-show="!scope.row.true">{{ scope.row.userPassword }}</span>
                        </template>
                    </el-table-column>

                    <el-table-column label="用户类型" width="100" align="center">
                        <template  slot="header">
                            <p>用户类型</p>
                            <!-- <el-select v-model="search3" size="mini" clearable placeholder="请选择教师权限">
                <el-option v-for="item in isAccomplish" :key="item.value" :label="item.label"
                  :value="item.value">
                </el-option>
              </el-select> -->

                        </template>
                          <template slot-scope="scope">
                            <el-input v-model="scope.row.userType" v-show="scope.row.true"></el-input>
                            <span  v-if="scope.row.userType == 0">普通用户</span>
                            <span  v-if="scope.row.userType == 1">管理员</span>
                        </template>
                    </el-table-column>

                    <el-table-column label="账号状态" width="100" align="center">
                        <template  slot="header">
                            <p>账号状态</p>
                        </template>
                          <template slot-scope="scope">
                            <span  v-if="scope.row.userStatus == 0">停用</span>
                            <span  v-if="scope.row.userStatus == 1">正常</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="用户性别" width="100" align="center">
                        <template  slot="header">
                            <p>用户性别</p>

                        </template>
                          <template slot-scope="scope">
                            <el-input v-model="scope.row.userSex" v-show="scope.row.true"></el-input>
                            <span  v-if="scope.row.userSex == 0">女</span>
                            <span  v-if="scope.row.userSex == 1">男</span>
                            <span  v-if="scope.row.userSex == 2">保密</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="用户地址" width="100" align="center">
                        <template slot="header">
                            <p>用户地址</p>
                        </template>
                          <template slot-scope="scope">
                            <span v-show="!scope.row.true">{{ scope.row.userLocation}}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="用户头像" width="150" align="center">
                        <template slot="header">
                            <p>用户头像</p>
                        </template>
                          <template slot-scope="scope">
                            <span v-show="!scope.row.true">{{ scope.row.userAvatar }}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="创建时间" width="200" align="center">
                          <template slot="header">
                            <p>创建时间</p>
                        </template>
                        <template slot-scope="scope">
                            <span v-show="!scope.row.true">{{ scope.row.userCreateTime}}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="更新时间" width="200" align="center">
                    <template slot="header">
                            <p>更新时间</p>
                        </template>
                          <template slot-scope="scope">
                            <span v-show="!scope.row.true">{{ scope.row.userUpdateTime}}</span>
                        </template>
                    </el-table-column>
                    <el-table-column label="操作" width="150px" fixed="right" align="center">
            <template slot-scope="scope">
              <el-button type="primary" size="mini"  @click="editUser(scope.$index)">编辑</el-button>
               <el-button type="danger" size="mini"  @click="deleteUser(scope.row)">删除</el-button>
            </template>
          </el-table-column>

                </el-table>
            </el-card>
        </div>
        <div  class="rightcard">
            <el-card >
                <!-- 搜索 -->
                <el-autocomplete
                class="searchAll"
                size="medium "
                v-model="state1"
                placeholder="请输入搜索内容"
                ></el-autocomplete>
                :fetch-suggestions="querySearch"
                <!--           @select="handleSelect" -->
            </el-card>
            <el-card >
                     <h4>性别</h4>
                <el-tag
                    :key="tag"
                    v-for="tag in dynamicTags"
                    closable
                    :disable-transitions="false"
                    @close="handleClose(tag)">
                    {{tag}}
                    </el-tag>
                    <el-divider >标签</el-divider>
                                    <el-tag
                    v-for="item in items"
                    :key="item.label"
                    :type="item.type"
                    effect="dark">
                    {{ item.label }}
                </el-tag>
            </el-card>

            <el-card >
                <h4>时间分类</h4>
                  <el-date-picker
                    v-model="value1"
                    type="monthrange"
                    align="right"
                    unlink-panels
                    size="max"
                    style="width:100%"
                    range-separator="至"
                    start-placeholder="开始月份"
                    end-placeholder="结束月份"
                    :picker-options="pickerOptions">
                    </el-date-picker>
            </el-card>

        </div>
    </el-main>
</template>

<script>

export default {
    name: "userManagement",
    data() {
        return {
            // 搜索
            state1:'',
            value: null,
            value1: null,
            restaurants: [],
            dynamicTags: ['标签一', '标签二', '标签三'],
            items:[],
            tableData: [],
            // 更新框
            updateTable:[],
            updateIndex:'',
            isnormal:false,
            statusTable: [{
                        value: '0',
                        label: '停用'
                    },{
                        value: '1',
                        label: '正常'
                    }],
            typeTable:[{
                value:'0',
                label:'普通用户'
            },{
                value:'1',
                label:'管理员'
            }],
            sexTable:[{
                value:'0',
                label:'女'
            },{
                value:'1',
                label:'男'
            },{
                value:'2',
                label:'保密'
            }],
            pickerOptions: {
                shortcuts: [{
                    text: '本月',
                    onClick(picker) {
                    picker.$emit('pick', [new Date(), new Date()]);
                    }
                },
                {
                text: '今年至今',
                onClick(picker) {
                    const end = new Date();
                    const start = new Date(new Date().getFullYear(), 0);
                    picker.$emit('pick', [start, end]);
                    }
                },
                {
                text: '最近六个月',
                    onClick(picker) {
                    const end = new Date();
                    const start = new Date();
                    start.setMonth(start.getMonth() - 6);
                    picker.$emit('pick', [start, end]);
                    }
                }]
            },
        }

    },
    created(){
    // 加载User数据
        api.get("/userManagement", "", (resp) => {
            for (let index = 0; index < resp.data.data.length; index++) {
            resp.data.data[index].true = false;
            }
            this.tableData = resp.data.data;
        });
        // setTimeout(() => {
        //     this.loading = false;
        // }, 2000);

    },
    methods:{
        // querySearch(queryString, cb) {
        //     var restaurants = this.restaurants;
        //     var results = queryString ? restaurants.filter(this.createFilter(queryString)) : restaurants;
        //     // 调用 callback 返回建议列表的数据
        //     cb(results);
        // },
        createFilter(queryString) {
        return (restaurant) => {
            return (restaurant.value.toLowerCase().indexOf(queryString.toLowerCase()) === 0);
            };
        },
          //删除用户信息
        deleteUser(item) {
        this.$confirm("是否删除?", "提示", {
            confirmButtonText: "确定",
            cancelButtonText: "取消",
            type: "warning",
        }).then(() => {
            api.del("/userManagement/deleteUser", item, (resp) => {
                console.log("deleteUser被调用");
                if (resp.data.flag) {
                this.$message({
                    type: "success",
                    message: "删除成功!",
                });
                location.reload();
                } else {
                this.$message({
                    type: "error",
                    message: "删除失败!",
                });
                }
            });
            })
            .catch(() => {
            this.$message({
                type: "info",
                message: "已取消",
            });
            });
        },
        //编辑用户信息
        editUser(index) {
            this.isnormal=true;
            this.updateIndex=index;
            this.updateTable=this.tableData[index];
        },
        //更新用户信息
        updateUser(formName) {
            this.tableData[  this.updateIndex]=this.updateTable;
        api.put("/userManagement/updateUser", this.tableData[this.updateIndex], (resp) => {
            console.log("updateUser被调用");
            if (resp.data.flag) {
                this.isnormal = false;
            this.$message({
                type: "success",
                message: "保存成功!",

            });
            this.resettable(formName);
            } else {
            this.$message({
                type: "error",
                message: resp.data.message,
            });
            }
        });
        },
        cancelUpdate(formName){
            this.resettable(formName);
            this.$message({
                type: "success",
                message: "取消更改!",
            });
            this.isnormal = false;
        },
        resettable(formName){
            this.updateTable=this.tableData[this.updateIndex];
            console.log(this.updateTable);

        }


    },
    mounted() {


}
}
</script>

<style scoped>

/* 主要布局 */
.mainPage{
    margin-left: 10%;
}

/* 左布局 */
.leftcard{
    float: left;
    width: 68%;
    margin:3% ;
}

.leftcard .el-card{
    width: 100%;
    margin-bottom: 50px;
    float: block;
}

/* 右布局 */
.rightcard{
    float: right;
    position: relative;
    margin-right:2% ;
    margin-top:3% ;
    width: 21%;
    min-width: 220px;
}

.rightcard .el-card{
    width: 100%;
    margin-bottom: 50px;
    float: block;
}

.searchAll{
    min-width: 100%;
        margin: 0;
    padding: 0;
}

.el-tag + .el-tag {
    margin-left: 10px;
  }



/* 主要区域 */
p {
    margin: 8px;

}



</style>
